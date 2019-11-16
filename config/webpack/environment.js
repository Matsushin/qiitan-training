const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const webpack = require('webpack')

environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
    })
)

environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
    })
)
environment.loaders.get('sass').use.splice(-1, 0, {
    loader: 'resolve-url-loader',
    // options: {
    //     attempts: 1
    // }
})

const config = environment.toWebpackConfig()
environment.loaders.append('vue', vue)

module.exports = environment
