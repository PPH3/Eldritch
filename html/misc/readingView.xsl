<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:eld="http://eldritch.code.newtfire.org"
    exclude-result-prefixes="xs eld math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:variable name="wordList" select="document('../xslt_and_python/fullList_syn.xml')"/>  
    <xsl:template match="/">      
      <html lang="en">
          <head><title><xsl:value-of select="//titleStmt/title"/></title>
        <link rel="stylesheet" type="text/css" href="Love_Code.css"/>
          </head>
              <body>
                  <!--#include virtual="headerSSI.html" -->
                  
                 <div id="page">
                 <div id="body"> 
          <h1><em><xsl:value-of select="//titleStmt/title"/></em></h1>   
                     <xsl:apply-templates select="//epigraph"/>
                     <xsl:apply-templates select="//docAuthor"/>
                    <xsl:apply-templates select="//body"/>
                 </div>   
                 </div>
              </body>
      </html>    
  </xsl:template>  
 <xsl:template match="epigraph">
     <em><xsl:apply-templates select="desc"/></em>
     <xsl:apply-templates/>
 </xsl:template>
    <xsl:template match="docAuthor">
        <em><xsl:apply-templates/></em>
    </xsl:template>
    <xsl:template match="div">
        <div class="{@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="q">
        <q><xsl:apply-templates/></q>
    </xsl:template>
   <xsl:template match="w">
       <mark class="{@type}" title="{@synsetCount}"><xsl:apply-templates/></mark>
       <span class="note"><xsl:apply-templates select="$wordList//eld:word[eld:w = lower-case(current()/normalize-space())]"/>
       </span>
   </xsl:template>
    <xsl:template match="$wordList//eld:word">
     <xsl:for-each select="eld:synset">
           <strong><xsl:value-of select="eld:synId"/><xsl:text>: </xsl:text></strong>
            <xsl:value-of select="eld:wnDef"/><br/>
        </xsl:for-each>
       
        
    </xsl:template>
  
</xsl:stylesheet>