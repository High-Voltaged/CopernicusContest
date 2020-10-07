/*
** TailwindCSS Configuration File
**
** Docs: https://tailwindcss.com/docs/configuration
** Default: https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
*/
module.exports = {
   theme: {
      screens: {
      'xs':'10px',
      'sm': '450px',
      'md': '650px',
      'lg': '950px',
      'xl': '1200px',
      '2xl': '1800px',
   
      'mdMax': {'max': '650px'},
      'lgMax': {'max': '950px'},
      },
   
      height: {
      full: '100%',
      screen: '100vh',
      px: '1px',
      px2: '2px',
      '1/2': '0.12rem',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '11/12': '91.666667%',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '9/5': '1.8rem',
      '8/5': '1.6rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '8': '2rem',
      '10': '2.5rem',
      '12': '3rem',
      '14' : '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '22': '5.5rem',
      '24': '6rem',
      '28': '7rem',
      '32': '8rem',
      '36': '9.5rem',
      '40': '10rem',
      '48': '12rem',
      '56': '14rem',
      '60': '15rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      '88': '22rem',
      '100': '25rem',
      '104': '26rem',
      '120': '30rem', 
      },
      width: {
         full: '100%',
         px: '1px',
         auto: 'auto',
      '1/2': '50%',
      '2/3': '66.666667%',
      '3/10': '30%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '7/10': '70%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '9/5': '1.8rem',
      '8/5': '1.6rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '8': '2rem',
      '10': '2.5rem',
      '12': '3rem',
      '14' : '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '22': '5.5rem',
      '24': '6rem',
      '32': '8rem',
      '36': '9.5rem',
      '40': '10rem',
      '48': '12rem',
      '56': '14rem',
      '58': '14.5rem',
      '64': '16rem',
      '66': '16.5rem',
      '72': '18rem',
      '80': '20rem',
      '120': '30rem',
      },
   
      minWidth: {
      full: '100%',
      px: '1px',
      auto: 'auto',
      '1/2': '50%',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '7/10': '70%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '8': '2rem',
      '10': '2.5rem',
      '12': '3rem',
      '14' : '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '22': '5.5rem',
      '24': '6rem',
      '32': '8rem',
      '36': '9.5rem',
      '40': '10rem',
      '48': '12rem',
      '56': '14rem',
      '58': '14.5rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      },
   
      maxWidth: {
      full: '100%',
      screen: '100vh',
      px: '1px',
      auto: 'auto',
      '1/2': '50%',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '7/20': '35%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '7/10': '70%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '8': '2rem',
      '10': '2.5rem',
      '12': '3rem',
      '14' : '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '22': '5.5rem',
      '24': '6rem',
      '32': '8rem',
      '36': '9.5rem',
      '40': '10rem',
      '48': '12rem',
      '56': '14rem',
      '58': '14.5rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      },
   
      minHeight: {
         full: '100%',
         px: '1px',
         auto: 'auto',
      '1/2': '50%',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '7/10': '70%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '8': '2rem',
      '10': '2.5rem',
      '12': '3rem',
      '14' : '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '22': '5.5rem',
      '24': '6rem',
      '32': '8rem',
      '36': '9.5rem',
      '40': '10rem',
      '48': '12rem',
      '56': '14rem',
      '58': '14.5rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      },
   
      maxHeight: {
      '98px': '98px',
      '130px': '130px',
         full: '100%',
         px: '1px',
         auto: 'auto',
      '1/2': '50%',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '7/10': '70%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '8': '2rem',
      '10': '2.5rem',
      '12': '3rem',
      '14' : '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '22': '5.5rem',
      '24': '6rem',
      '32': '8rem',
      '36': '9.5rem',
      '40': '10rem',
      '48': '12rem',
      '56': '14rem',
      '58': '14.5rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      '120': '30rem', 
      },
   
      spacing: {
      full: '100%',
      px: '1px',
      '1/10': '10%',
      '1/2': '50%',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '7/10': '70%',
      '5/6': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '0': '0',
      '1': '0.25rem',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '7': '1.75rem',
      '8': '2rem',
      '9': '2.25rem',
      '10': '2.5rem',
      '11': '2.25rem',
      '12': '3rem',
      '13': '3.25rem',
      '14': '3.5rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '24': '6rem',
      '25': '6.25rem',
      '26': '6.5rem',
      '28': '7rem',
      '32': '8rem',
      '36': '9rem',
      '40': '10rem',
      '44': '11rem',
      '48': '12rem',
      '56': '14rem',
      '58': '14.5rem',
      '60': '15rem',
      '62': '15.5rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      '88': '22rem',
      },
   
      inset: {
      '0' : 0,
      full: '100%',
      px: '1px',
      '-1/4': '-0.25rem',
      '-1/3': '-0.33rem',
      '-1/2': '-0.5rem',
      '-1': '-0.25rem',
      '-2': '-0.5rem',
      '-3': '-0.75rem',
      '-4': '-1rem',
      '-8': '-2rem',
      '-88': '-22rem',
      '1/20' : '5%',
      '1/2': '0.12rem',
      '1/10': '10%',
      '1/2': '50%',
      '2/3': '66.666667%',
      '1/3': '33.333333%',
      '2/3': '66.666667%',
      '1/4': '25%',
      '2/4': '50%',
      '3/4': '75%',
      '1/5': '20%',
      '2/5': '40%',
      '3/5': '60%',
      '4/5': '80%',
      '1/6': '16.666667%',
      '2/6': '33.333333%',
      '3/6': '50%',
      '4/6': '66.666667%',
      '5/7': '70%',
      '7/10': '83.333333%',
      '1/12': '8.333333%',
      '2/12': '16.666667%',
      '3/12': '25%',
      '4/12': '33.333333%',
      '5/12': '41.666667%',
      '6/12': '50%',
      '7/12': '58.333333%',
      '8/12': '66.666667%',
      '9/12': '75%',
      '10/12': '83.333333%',
      '9/10': '90%',
      '11/12': '91.666667%',
      '19/20': '95%',
      '0': '0',
      '1': '0.25rem',
      '2': '0.5rem',
      '3': '0.75rem',
      '4': '1rem',
      '5': '1.25rem',
      '6': '1.5rem',
      '7': '1.75rem',
      '8': '2rem',
      '9': '2.25rem',
      '10': '2.5rem',
      '11': '2.25rem',
      '12': '3rem',
      '16': '4rem',
      '18': '4.5rem',
      '20': '5rem',
      '24': '6rem',
      '25': '6.25rem',
      '26': '6.5rem',
      '28': '7rem',
      '32': '8rem',
      '36': '9rem',
      '40': '10rem',
      '44': '11rem',
      '48': '12rem',
      '56': '14rem',
      '64': '16rem',
      '72': '18rem',
      '80': '20rem',
      '88': '22rem',
      },
   
      extend: {
   
         flex: {
            '0': '0 0 auto',         
         },
   
         colors: {
   
            gray: {
               100: '#f7fafc',
               200: '#edf2f7',
               300: '#e2e8f0',
               400: '#cbd5e0',
               500: '#a0aec0',
               600: '#718096',
               700: '#4a5568',
               800: '#2d3748',
               900: '#1a202c',
               tertiary: '#35314d', 
               secondary: '#1b172e', // navbar background-color 
               primary: '#312D4A', 
               main: '#211d34', // background-color of the main container 
            },
   
            red: {
               100: '#fff5f5',
               200: '#fed7d7',
               300: '#feb2b2',
               400: '#fc8181',
               500: '#f56565',
               600: '#e53e3e',
               700: '#c53030',
               800: '#9b2c2c',
               900: '#742a2a',
         
               primary: 'rgba(244, 67, 54, .8)',
            },         
   
            purple: {
               100: '#faf5ff',
               200: '#e9d8fd',
               300: '#d6bcfa',
               400: '#b794f4',
               500: '#9f7aea',
               600: '#805ad5',
               700: '#6b46c1',
               800: '#553c9a',
               900: '#44337a',
         
               secondary: '#7a58c5',
            },
   
         },
   
         boxShadow: {
            solid: '0 0 0 1.5px #cbd5e0',
            solidDark: '0 0 0 2px #1b172e',
      
            mdIn: 'inset 1px 4px 2rem -1px rgba(0, 0, 0, .3), inset 0 2px 4px -1px rgba(0, 0, 0, .06)',
            red: '0 0 0 3px rgb(244, 67, 54)',
            green: '0 0 0 3px #68d391',
      
            focus: '0 0 0 3px rgba(66,153,225,0.5)',
            black: '-1rem 0 2rem 0 rgba(25, 23, 35, 1)',
      
            navbar: '0 3px 5px 0 rgba(0, 0, 0, 0.5)',
            footer: '0 -4px 1rem -3px rgba(0, 0, 0, 0.4)',
         }, 
   
      },
   
      zIndex: {
      '10': '10',
      '20': '20',
      '30': '30',
      '40': '40',
      '50': '50',
      },
   
   },
      variants: {},
      plugins: [
         require('@tailwindcss/custom-forms')
      ]
   }
   