var request  = require('request'),
    dataPath = './projetos/_data.json',
    data     = require(dataPath),
    fs       = require('fs');


var getRepos = function getRepos () {
  var req = request.get({
    url: 'https://api.github.com/users/vitorleal/repos?page=1&per_page=25&sort=updated',
    headers: {
      'User-Agent': 'vitorleal'
    }
  }, function (err, res, body) {
    data.repos = JSON.parse(body);

    fs.writeFile(dataPath, JSON.stringify(data, null, 2), function (err) {
      if (err) {
        console.log(err);
      } else {
        console.log('Repos updated ;)');
      }
    });
  });
};


getRepos();
