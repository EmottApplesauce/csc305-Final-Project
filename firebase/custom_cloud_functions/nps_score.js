const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.npsScore = functions.https.onCall(async (data, context) => {
  try {
    const db = admin.firestore();

    const snapshot = await db.collection("npsResponses").get();

    if (snapshot.empty) {
      return { npsScore: 0, totalResponses: 0 };
    }

    let promoters = 0;
    let passives = 0;
    let detractors = 0;
    let total = 0;

    snapshot.forEach((doc) => {
      const { score } = doc.data();
      if (typeof score === "number") {
        if (score >= 9) promoters++;
        else if (score >= 7) passives++;
        else detractors++;
        total++;
      }
    });

    if (total === 0) return { npsScore: 0, totalResponses: 0 };

    const npsScore = Math.round(((promoters - detractors) / total) * 100);

    await db
      .collection("npsResults")
      .doc("summary")
      .set({
        npsScore,
        totalResponses: total,
        promoters,
        passives,
        detractors,
        promoterPercent: Math.round((promoters / total) * 100),
        passivePercent: Math.round((passives / total) * 100),
        detractorPercent: Math.round((detractors / total) * 100),
        calculatedAt: admin.firestore.FieldValue.serverTimestamp(),
      });

    return { npsScore, totalResponses: total };
  } catch (error) {
    throw new functions.https.HttpsError("internal", error.message);
  }
});
