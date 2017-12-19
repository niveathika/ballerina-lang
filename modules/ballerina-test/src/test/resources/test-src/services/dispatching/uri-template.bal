import ballerina.net.http;

@http:configuration {basePath:"/ecommerceservice"}
service<http> Ecommerce {
    @http:resourceConfig {
        methods:["GET"],
        path:"/products/{productId}/{regId}"
    }
    resource productsInfo1 (http:Connection con, http:Request req, string productId, string regId) {
        string orderId = req.getHeader("X-ORDER-ID").value;
        println("Order ID " + orderId);
        println("Product ID " + productId);
        println("Reg ID " + regId);
        json responseJson = {"X-ORDER-ID":orderId, "ProductID":productId, "RegID":regId};
        println(responseJson.toString());

        http:Response res = {};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/products2/{productId}/{regId}/item"
    }
    resource productsInfo2 (http:Connection con, http:Request req, string productId, string regId) {
        json responseJson;
        println("Product ID " + productId);
        println("Reg ID " + regId);
        responseJson = {"Template":"T2", "ProductID":productId, "RegID":regId};
        println(responseJson.toString());

        http:Response res = {};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/products3/{productId}/{regId}/*"
    }
    resource productsInfo3 (http:Connection con, http:Request req, string productId, string regId) {
        json responseJson;
        println("Product ID " + productId);
        println("Reg ID " + regId);
        responseJson = {"Template":"T3", "ProductID":productId, "RegID":regId};
        println(responseJson.toString());

        http:Response res = {};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/products/{productId}"
    }
    resource productsInfo4 (http:Connection con, http:Request req, string productId) {
        json responseJson;
        map params = req.getQueryParams();
        string rID;
        rID, _ = (string)params.regID;
        println("Product ID " + productId);
        println("Reg ID " + rID);
        responseJson = {"Template":"T4", "ProductID":productId, "RegID":rID};
        println(responseJson.toString());

        http:Response res = {};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/products"
    }
    resource productsInfo6 (http:Connection con, http:Request req) {
        json responseJson;
        map params = req.getQueryParams();
        string prdID;
        string rID;
        prdID, _ = (string)params.prodID;
        rID, _ = (string)params.regID;
        println ("Product ID " + prdID);
        println ("Reg ID " + rID);
        responseJson = {"Template":"T6", "ProductID":prdID, "RegID":rID};
        println (responseJson.toString ());

        http:Response res = {};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["GET"],
        path:"/products5/{productId}/reg"
    }
    resource productsInfo5 (http:Connection con, http:Request req, string productId) {
        json responseJson;
        map params = req.getQueryParams();
        string rID;
        rID, _ = (string)params.regID;
        println("Product ID " + productId);
        println("Reg ID " + rID);
        responseJson = {"Template":"T5", "ProductID":productId, "RegID":rID};
        println(responseJson.toString());

        http:Response res = {};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        path:""
    }
    resource echo1 (http:Connection con, http:Request req) {
        http:Response res = {};
        json responseJson = {"echo11":"echo11"};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }
}

@http:configuration {
    basePath:"/options"
}
service<http> echo111 {

    @http:resourceConfig {
        methods:["POST", "UPDATE"],
        path : "/test"
    }
    resource productsInfo99 (http:Connection con, http:Request req) {
        http:Response res = {};
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["OPTIONS"],
        path : "/hi"
    }
    resource productsOptions (http:Connection con, http:Request req) {
        http:Response res = {};
        json responseJson = {"echo":"wso2"};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["GET", "PUT"],
        path : "/test"
    }
    resource productsInfo98 (http:Connection con, http:Request req) {
        http:Response res = {};
        _ = con.respond(res);

    }

    @http:resourceConfig {
        methods:["GET"],
        path : "/getme"
    }
    resource productsGet (http:Connection con, http:Request req) {
        http:Response res = {};
        json responseJson = {"echo":"get"};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["POST"],
        path : "/post"
    }
    resource productsPOST (http:Connection con, http:Request req) {
        http:Response res = {};
        json responseJson = {"echo":"post"};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }

    @http:resourceConfig {
        methods:["PUT"],
        path : "/put"
    }
    resource productsPUT (http:Connection con, http:Request req) {
        http:Response res = {};
        json responseJson = {"echo":"put"};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }
}

@http:configuration {
    basePath:"/noResource"
}
service<http> echo112 {
}

@http:configuration {
    basePath:"hello/"
}
service<http> serviceHello {

    @http:resourceConfig {
        methods:["GET"],
        path:"/test/"
    }
    resource productsInfo (http:Connection con, http:Request req) {
        http:Response res = {};
        json responseJson = {"echo":"sanitized"};
        res.setJsonPayload(responseJson);
        _ = con.respond(res);
    }
}
