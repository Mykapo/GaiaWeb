import Foundation
import Kitura
import KituraCompression
import KituraStencil
import HeliumLogger

HeliumLogger.use()

let router = Router()
router.all(middleware: [Compression(), StaticFileServer()])
router.setDefault(templateEngine: StencilTemplateEngine())

router.get("/") { _, response, next in
    do {
        try response.render("index", context: [:]).end()
        next()
    } catch let error {
        response.send(error.localizedDescription)
    }
}

router.get("/:page") {
    request, response, next in
    
    if let page = request.parameters["page"] {
        if page == "notfound" {
            next()
        }
        
        do {
            try response.render(page, context: [:]).end()
            next()
        } catch _ {
            do {
                response.status(.notFound)
                try response.render("404", context: [:]).end()
                next()
            } catch let error {
                response.send(error.localizedDescription)
            }
        }
    } else {
        do {
            try response.send(status: .badGateway).end()
            next()
        } catch let e {
            response.send(e.localizedDescription)
        }
        
    }
}

Kitura.addHTTPServer(onPort: 80, with: router)
Kitura.run()
