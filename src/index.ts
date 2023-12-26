import express from 'express'
import axios from 'axios'
import cors from 'cors'
const app = express()
const port = process.env.PORT || 3006
const baseUrl = process.env.BASE_URL || 'https://api.uptimerobot.com/v2'

// 解析JSON格式的请求体
app.use(express.json())
// 解析URL编码格式的请求体
app.use(express.urlencoded({extended: true}))

app.use(
	cors({
		origin: '*',
		methods: ['GET', 'POST', 'PUT', 'DELETE'],
		allowedHeaders: ['Content-Type', 'Authorization'],
		credentials: true
	})
) // 启用 CORS 中间件

app.all('/api/*', async (req, res) => {
	console.log(req.path, req.method, req.query, req.body)
	const apiUrl = req.url.replace('/api', '') // 去除路径中的/v2前缀
	const proxyUrl = `${baseUrl}${apiUrl}`
	const apiKey = req.query.api_key || req.body.api_key // 获取 api_key 参数的值
	if (!apiKey) {
		return res.status(400).json({code: 400, msg: 'api_key parameter is missing'})
	}
	try {
		const response = await axios.post(proxyUrl, {
			...req.body,
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
