"use strict";var _inkdrop=require("inkdrop");var _remarkAnchor=require("./remark-anchor");module.exports={origAComponent:null,config:{autolinks:{title:"Create link cards from standard URLs",type:"boolean",default:true},imageShape:{title:"Cover image shape",type:"string",default:"wide",enum:["square","wide"]}},activate(){if(_inkdrop.markdownRenderer){const OrigA=_inkdrop.markdownRenderer.remarkReactComponents.a;const RemarkAnchor=(0,_remarkAnchor).createRemarkAnchor(OrigA);_inkdrop.markdownRenderer.remarkReactComponents.a=RemarkAnchor;this.origAComponent=OrigA}},deactivate(){if(_inkdrop.markdownRenderer){_inkdrop.markdownRenderer.remarkReactComponents.a=this.origAComponent}}}