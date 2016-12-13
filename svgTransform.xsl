<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
        <html>
            <head></head>
            <body><svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
                <desc></desc>
                <g alignment-baseline="baseline"></g>
                <text x="100" y="50" fill="purple" font-size="25px">Number of Synsets</text>
                <!--x axis-->
                <line x1="150" y1="600" x2="750" y2="600" stroke="black" stroke-width="3"/>
                <!--y axis-->
                <line x1="150" y1="600" x2="150" y2="100" stroke="black" stroke-width="3"/>
                <!--grid lines-->
                
            
            
            
            
            
            
            
            
            </svg>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>