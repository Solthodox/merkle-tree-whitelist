const {Deploy} = require("./deploy")
const {getMerkleRootOfAddresses} = require("./merkleTree")

const main = () =>{
    getMerkleRootOfAddresses()
        .then(Deploy)
        .catch((e)=>console.log(e))
}

main()