//https://dev.to/pratik14/deleting-all-firebase-users-l4d
const admin = require("firebase-admin");
const serviceAccount = require("./stpaulsrkl-admission-d5a926ab4e78.json");
const databaseURL = "https://stpaulsrkl-erp.firebaseio.com"

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: databaseURL,
});

const deleteAllUsers = (nextPageToken) => {
  let uids = []
  admin
    .auth()
    .listUsers(100, nextPageToken)
    .then((listUsersResult) => {
      uids = uids.concat(listUsersResult.users.map((userRecord) => userRecord.uid))
      console.log(uids)
      if (listUsersResult.pageToken) {
        deleteAllUsers(listUsersResult.pageToken);
      }
    })
    .catch((error) => {
      console.log('Error listing users:', error);
    }).finally(() => {
      admin.auth().deleteUsers(uids)
    })
};

deleteAllUsers();