var path = require('path');

module.exports = {
    mode: 'production',
    entry: path.join(__dirname, 'srcjs', 'dataui.jsx'),
    output: {
        path: path.join(__dirname, 'inst/htmlwidgets'),
        filename: 'dataui.js'
    },
    module: {
        rules: [
            {
                test: /\.jsx?$/,
                loader: 'babel-loader',
                options: {
                    presets: ['@babel/preset-env', '@babel/preset-react']
                }
            }
        ]
    },
    externals: {
        'react': 'window.React',
        'react-dom': 'window.ReactDOM',
        'reactR': 'window.reactR'
    },
    stats: {
        colors: true
    }//,
    //devtool: 'source-map'
};
