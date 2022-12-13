const cds = require('@sap/cds');
const hello = require('./utils/hello');

module.exports = cds.service.impl(async function () {
    const { Books } = this.entities;

    this.on('getBooksID', async (req) => {
        try {
            console.log('hola')
            const aBooksID = await SELECT `ID,name` .from (Books); // CQL
            console.log('Books print', aBooksID);        
            
            return aBooksID;
        } catch (error) {
            console.log("Error", error);
            req.reject(400, error);
        }
    });

    this.on('batchBooks', async (req) => {
        console.log(req.data.value);
        
        try {
            return req.data.value;
        } catch (error) {
            console.log("Error", error);
            req.reject(400, error);
        }
    });

    this.on('salutations', async () => {
        let myVariable = hello();
        console.log(myVariable);
        return myVariable;
    });
});