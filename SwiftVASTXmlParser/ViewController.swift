//
//  ViewController.swift
//  SwiftVASTXmlParser
//
//  Created by Kristijan Kontus on 20/03/2017.
//  Copyright © 2017 com.kkontus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, ResponseObserver {
    var xmlParser: XMLParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // loadXmlFromNet()
        loadXmlLocally()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadXmlLocally() {
        //let fileName = "vast_full"
        let fileName = "vast"
        let fileType = "xml"
        let xml = loadXmlFromFile(fileName: fileName, fileType: fileType)
        // let xml = loadXmlFromCode()
        print("Loaded XML file:")
        // print(xml)
        
        let vastModel = VAST(xmlString: xml)
        print("\(vastModel)")
    }
    
    private func loadXmlFromCode() -> String {
        let xml = "<VAST version=\"3.0\">\n" +
            "  <Ad id=\"1413833\">\n" +
            "    <InLine>\n" +
            "      <AdSystem>TestSystemCode</AdSystem>\n" +
            "      <AdTitle/>\n" +
            "      <Error><![CDATA[http://main.vagrant.dev/view.php?errorcode=[ERRORCODE]&idzone=2051755]]></Error>\n" +
            "      <Creatives>\n" +
            "        <Creative sequence=\"1\" id=\"13803673\">\n" +
            "          <Linear skipoffset=\"00:00:11\">\n" +
            "            <Duration>00:00:13.35</Duration>\n" +
            "            <TrackingEvents>\n" +
            "              <Tracking event=\"progress\" offset=\"00:00:10.000\"><![CDATA[http://main.vagrant.dev/view.php?tracking_event=progress&progress=00:00:10.000&idzone=2051755]]></Tracking>\n" +
            "            </TrackingEvents>\n" +
            "            <VideoClicks>\n" +
            "              <ClickThrough><![CDATA[http://main.vagrant.dev/click.php?data=IHwxNDEzODMzfHxodHRwJTNBJTJGJTJGZ29vZ2xlMS5iZ3x8fDB8fDE0ODcyMzYzNjd8bWFyaW4xLjBjYXRjaC5jb218MTAuNDIuMC4xfHwxMzgwMzY3M3wyMDUxNzU1fDQ3Mnw1MXw0MXwzfDE1fDB8MHx8fDF8MHx8NThhMWFkNTY4OTZkZTUuODgxNDk1ODQyMjY4MjgyMzMyfDE4NTl8fDF8MHx8MHwwfDB8ICB8fDF8T0t8Y2VlMTYyNzQ2MTIyOGMyOGQ5MTE4YTBkM2U0YWRmYTM%3D]]></ClickThrough>\n" +
            "            </VideoClicks>\n" +
            "            <MediaFiles>\n" +
            "              <MediaFile delivery=\"progressive\" type=\"video/mp4\"><![CDATA[http://static.vagrant.dev/6a97888ec52c042c679a36e919843cca/videos/359836/1719100027841900_1.mp4]]></MediaFile>\n" +
            "            </MediaFiles>\n" +
            "          </Linear>\n" +
            "        </Creative>\n" +
            "      </Creatives>\n" +
            "    </InLine>\n" +
            "  </Ad>\n" +
        "</VAST>";
        
        return xml
    }
    
    private func loadXmlFromFile(fileName: String, fileType: String) -> String {
        let path = Bundle.main.path(forResource: fileName, ofType: fileType)
        
        var xml: String = ""
        do {
            xml = try String(contentsOfFile: path!)
        } catch {
            print(error)
        }
        
        return xml
    }
    
    private func loadXmlFromNet() {
        var params: [String : String] = [:]
        params["idzone"] = "2164533"
        params["coun"] = "USA"
        
        ExadsSDK.getVAST(self, params: params)
    }
    
    func onSuccess(_ xmlData: Data) {
        let vastModel = VAST(xmlData: xmlData)
        print("\(vastModel)")
    }
    
    func onSuccess(_ statusCode: Int, calledBy: String) {
        print("\(calledBy)")
        print("\(statusCode)")
    }
    
    func onError(_ error: Error, calledBy: String) {
        print("\(calledBy)")
        print("\(error)")
    }
    
}

