var path = require('path');

module.exports = {
    mode: 'production',
    entry: path.join(__dirname, 'dataui.js'),
    output: {
        path: path.join(path.normalize(path.join(__dirname, '..', '..')), 'inst', 'www'),
        filename: 'dataui.standalone.js',
        library: 'dataui',
        libraryTarget: 'var'
    },
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
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
    },
    devtool: 'source-map'
};
