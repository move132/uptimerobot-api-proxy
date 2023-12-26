import express from 'express'
import axios from 'axios'
import cors from 'cors'

const app = express()
const port = process.env.PORT || 3006
const baseUrl = process.env.BASE_URL || 'https://api.uptimerobot.com/v2'

app.use(
	cors({
		origin: '*',
		methods: ['GET', 'POST', 'PUT', 'DELETE'],
		allowedHeaders: ['Content-Type', 'Authorization'],
		credentials: true
	})
) // 启用 CORS 中间件

app.get('/api/*', async (req, res) => {
	const apiKey = req.query.api_key // 获取 api_key 参数的值
	const apiUrl = req.url.replace('/api', '') // 去除路径中的/v2前缀
	const proxyUrl = `${baseUrl}${apiUrl}`
	if (!apiKey) {
		return res.status(400).json({code: 400, msg: 'api_key parameter is missing'})
	}
	try {
		const response = await axios.post(proxyUrl, {
			api_key: apiKey,
			...req.query,
			headers: {
				'Content-Type': 'application/json',
				Accept: 'application/json'
			}
		})

		res.json(response.data)
	} catch (error) {
		console.error(error)
		res.status(500).json({code: 500, msg: 'An error occurred'})
	}
})

app.listen(port, () => {
	console.log(`Proxy server is running on port ${port}`)
})
