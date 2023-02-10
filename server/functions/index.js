const functions = require("firebase-functions");

// const { apiKey, webhookSecret } = require("../../api_key").default;

const { Client, resources, Webhook } = require("coinbase-commerce-node");
Client.init('9eb456ac-07ef-4f95-af88-c61ae463f5b2');

const { Change } = resources;

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const cors = require("cors")({ origin: "*" });

exports.createCharge = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    // const chargeData = {
    //   name: "Widget",
    //   description: "Useless widget created by Fireship",
    //   local_price: {
    //     amount: 9.99,
    //     currency: "USD",
    //   },
    //   pricing_type: "fixed_price",
    //   metadata: {
    //     user: "jeffd23",
    //   },
    // };

    // const charge = await Change.create(chargeData);

    const product = req.body;

    const charge = await Change.create(product);

    console.log(charge);

    res.send(charge);
  });
});

exports.webhookHandler = functions.https.onResquest( async(req, res) => {
  const rawBody = req.rawBody;

  const signature = req.headers["x-cc-webhook-signature"];

  try {
    const event = Webhook.verifyEventBody(rawBody, signature, '801e77c6-1546-48b0-9602-8ea2acf99885');

    if (event.type === "charge:pending") {
    }
    if (event.type === "charge:confirmed") {
    }
    if (event.type === "charge:failed") {
    }
    if (event.type === "charge:delayed") {
    }
    if (event.type === "charge:resolved") {
    }
    if (event.type === "charge:created") {
    }

    res.send(`sucess ${event.id}`);
  } catch (error) {
    functions.logger.error(error);
    res.status(400).send("failure");
  }
});
