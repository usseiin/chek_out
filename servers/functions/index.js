const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// const functions = require("firebase-functions");

// const { apiKey, webhookSecret } = require("../../api_key").default;
const cors = require("cors")({ origin: "*" });

const { Client, resources, Webhook } = require("coinbase-commerce-node");
Client.init("9eb456ac-07ef-4f95-af88-c61ae463f5b2");

const { Charge } = resources;

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.createCharge = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    // TODO get real product data from database

    const product = JSON.parse(req.body);
    // const product = {
    //   name: 'Widget',
    //   description: 'Useless widget created by Fireship',
    //   local_price: {
    //     amount: 9.99,
    //     currency: 'USD',
    //   },
    //   pricing_type: 'fixed_price',
    //   metadata: {
    //     user: 'jeffd23',
    //   },
    // };
    console.log(product);

    const charge = await Charge.create(product);

    console.log(charge);

    res.send(charge);
  });
});

exports.webhookHandler = functions.https.onRequest(async (req, res) => {
  const rawBody = req.rawBody;
  const signature = req.headers["x-cc-webhook-signature"];
  const webhookSecret = "801e77c6-1546-48b0-9602-8ea2acf99885";

  try {
    const event = Webhook.verifyEventBody(rawBody, signature, webhookSecret);

    if (event.type === "charge:pending") {
      // TODO
      // user paid, but transaction not confirm on blockchain yet
    }

    if (event.type === "charge:confirmed") {
      // TODO
      // all good, charge confirmed
    }

    if (event.type === "charge:failed") {
      // TODO
      // charge failed or expired
    }

    res.send(`success ${event.id}`);
  } catch (error) {
    functions.logger.error(error);
    res.status(400).send("failure!");
  }
});
