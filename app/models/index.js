var orm      = require('orm');
var settings = require(process.cwd() + '/config/settings');

var connection = null;

var Comment = require('./comment');
var Message = require('./message');

function setup(db, cb) {
  require('./message')(orm, db);
  require('./comment')(orm, db);

  return cb(null, db);
}


module.exports = function (cb) {
  if (connection) return cb(null, connection);

  orm.connect(settings.database, function (err, db) {
    if (err) return cb(err);
    console.log(" Connection Established ");

    connection = db;
    
   Comment.sync(function (err) {
          console.log(" Comment  saved! ");
        });
   Message.sync(function (err) {
          console.log(" Message  saved! ");
        });
    //setup(db, cb);
  });
};
