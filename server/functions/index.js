const functions = require("firebase-functions");
const cors = require('cors')({origin: '*'});
const { Client, resources, Webhook } = require("coinbase-commerce-node");

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

Client.init(coinbaseApiKey);

const { Charge } = resources;

exports.webhookHandler = functions.https.onRequest((req, res) => {
    const rawBody = req.rawBody;
    const signature = req.headers['x-cc-webhook-signature'];
    const webhookSecret = webhookSecretKey;

    try {
        const event = Webhook.verifyEventBody(rawBody, signature, webhookSecret);
        console.log(event);

        if (event.type === 'charge:confirmed') {
            res.send('success! transacton complete');
        }

        if (event.type === 'charge:created') {
            res.send('transacton created');
        }

        if (event.type === 'charge:delayed') {
            res.send('charges delayed');
        }

        if (event.type === 'charge:failed') {
            res.send('transaction failed');
        }

        if (event.type === 'charge:pending') {
            res.send('transacton pending');
        }

        if (event.type === 'charge:resolved') {
            res.send('transaction resolve');
        }

        res.send(`success ${event.id}`);
    } catch (error) {
        functions.logger.error(error);
    }
});

exports.createCharge = functions.https.onRequest(
    (req, res) => {
        cors(req, res, async () => {
          // TODO get real product data from database
      
          const chargeData = req.body;
      
          const charge = await Charge.create(chargeData);
          console.log(charge);
      
          res.send(charge);
        });
      }
);


