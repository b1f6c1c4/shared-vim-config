const rl = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false,
});

const toHex = (up) => (dec) => {
  const v = (dec + 0x100).toString(16).substr(-2);
  return up ? v.toUpperCase() : v.toLowerCase();
};

rl.on('line', (line) => {
  console.log(line
    .replace(/(?<=\bgui[bf]g=)#[0-9a-fA-F]{6}/g, (match) => {
      const r = parseInt(match.substr(1, 2), 16);
      const g = parseInt(match.substr(3, 2), 16);
      const b = parseInt(match.substr(5, 2), 16);
      const h = toHex(/[A-Z]/.test(match));
      return `#${h(255 - r)}${h(255 - g)}${h(255 - b)}`;
    })
    .replace(/(?<=\bgui[bf]g=)(?:black|white|blue|yellow|darkgray|green|cyan|lightblue|brown|magenta)\b/g, (match) => ({
      black: '#dcdcdc',
      white: 'black',
      blue: 'lightyellow',
      yellow: 'blue',
      darkgray: 'lightgray',
      green: 'magenta',
      magenta: 'green',
      cyan: 'red',
      red: 'cyan',
      lightblue: 'yellow',
      brown: 'lightmagenta',
    })[match]));
});
