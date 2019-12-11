const Express = require('express')
const router = Express.Router()

const getHtml = async (req, res, next) => {
    const zmienna = req.params.zmienna
    console.log(`zmienna to ${zmienna}`)
    const fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl
    console.log(`zadany url to ${fullUrl}`)
    let result = {
        wynik : 'brawo'
    }
    if (zmienna === '2') {
        result = {
            wynik: 'dwoja !! '
        }
    }
    res.send(JSON.stringify(result))
}


router.get('/', getHtml)

module.exports = {router}
