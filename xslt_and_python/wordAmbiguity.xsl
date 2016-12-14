<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <html>
            <head>Table</head>
            <body>
        <table>
        <tr>
            <th>Word</th>
            <th>Word Type</th>
            <th>Number of Synsets</th>
            <th>Count Within Call of Cthulhu</th>
            <th>Count Within Mountains of Madness</th>
            <th>Count Within Shadow Over Innsmouth</th>
            <th>Total Word Count</th>
            <th>List of Synset</th>
            <xsl:apply-templates select="//word"><xsl:sort select="descendant::synsetCount/number()" order="descending"/></xsl:apply-templates>
        </tr>
        </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="word">
        <tr>
            <td><xsl:apply-templates select="descendant::w"/></td>
            <td><xsl:apply-templates select="w/@type"/></td>
            <td><xsl:apply-templates select="synsetCount"/></td>
            <td><xsl:apply-templates select="descendant::work[child::title='The Call of Cthulhu']/descendant::localCount"/></td>
            <td><xsl:apply-templates select="descendant::work[child::title='At The Mountains of Madness']/descendant::localCount"/></td>
            <td><xsl:apply-templates select="descendant::work[child::title='The Shadow Over Innsmouth']/descendant::localCount"/></td>
            <td><xsl:apply-templates select="descendant::totalCount"/></td>
            <td><ul><xsl:apply-templates select="descendant::synset"/></ul></td>
        </tr>
    </xsl:template>
    <xsl:template match="synset">
                <li><xsl:apply-templates select="synId"/></li>    </xsl:template>
</xsl:stylesheet>