const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        // Configure your color palette here
          'denim': {
            '50': '#eefaff',
            '100': '#d8f3ff',
            '200': '#baeaff',
            '300': '#8bdfff',
            '400': '#55caff',
            '500': '#2daeff',
            '600': '#1791f9',
            '700': '#0f75e0',
            '800': '#1360ba',
            '900': '#165292',
            '950': '#133358',
        },    
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
