const admin = require("firebase-admin/app");
admin.initializeApp();

const npsScore = require("./nps_score.js");
exports.npsScore = npsScore.npsScore;
