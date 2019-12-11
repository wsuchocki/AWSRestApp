const Express = require('express')

const health = Express.Router()

health.get('/', async (req, res, next) => { res.send('UP') })
const ruterek = require('./ruterek').router

const app = Express()

app.use('/api/health', health)

app.use('/zima', ruterek)

const run = async () => {
    let server = app.listen(3000, e => console.log(e || 'Server is listening at port 3000'))
    return server
}

module.exports = run()
