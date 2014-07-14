/**
 * $ node filesizediff.js /alligo/data/tmp/twitter-argvsger 10
 */
var args = process.argv.slice(2);
var delay = !!args[1] ? args[1] * 1000 : 10000;

function getFilesizeFile (filename) {
  var stats, fs = require('fs');
  stats = fs.statSync(filename);
  return stats["size"];
}

function getFilesizeDirectory (dir) {
  var filesSizes = {}, fs = require('fs');
  var files = fs.readdirSync(dir);
  for (var i in files) {
    if (!files.hasOwnProperty(i))
      continue;
    var name = dir + '/' + files[i];
    if (!fs.statSync(name).isDirectory()) {
      filesSizes[files[i]] = getFilesizeFile(name);
      //fileList.push(name);
    }
  }

  return filesSizes;
}
function diff (start, end) {
  var diff = {};
  for (it in start) {
    if (start.hasOwnProperty(it)) {
      diff[it] = end[it] - start[it];
      if (diff[it] > 0) {
        diff[it] = Math.round(diff[it] / 1024);
      }
    }
  }
  return diff;
}


var start = getFilesizeDirectory(args[0]);
setTimeout(function() {
  var end = getFilesizeDirectory(args[0]);
  //console.log(start, end);
  console.log(diff(start, end));
}, delay);


//console.log(getFilesizeDirectory(args[0]));
//console.log(getFilesizeDirectory('/alligo/data/tmp/twitter-argvsger'));
//console.log(getFilesRecursiveSync('/alligo/data/tmp/twitter-argvsger'));