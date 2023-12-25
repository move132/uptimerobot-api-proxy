import express from 'express';
import axios from 'axios';
import cors from 'cors';

const app = express();
const port = 9008;
app.use(cors()); // 启用 CORS 中间件

app.get('/status', async (req, res) => {
    const apiKey = req.query.api_key; // 获取 api_key 参数的值

    if (!apiKey) {
        return res.status(400).json({ error: 'api_key parameter is missing' });
    }
    try {
        const response = await axios.post('https://api.uptimerobot.com/v2/getMonitors', {
            api_key: apiKey,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }
        });

        res.json(response.data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'An error occurred' });
    }
});

app.listen(port, () => {
    console.log(`Proxy server is running on port ${port}`);
});