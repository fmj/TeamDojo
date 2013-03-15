<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
      <html>
        <body>
          <table>
            <tr>
              <th>Programmers</th>
              <th>Skills</th>
              <th>Recommends</th>
            </tr>
            <xsl:for-each select="/*[local-name()='Network']/*[local-name()='Programmer']">
              <tr>
                <td>
                  <xsl:value-of select="./@name"/>
                </td>
                <td>
                  <xsl:for-each select="./*[local-name()='Skills']/*[local-name()='Skill']">
                    <xsl:value-of select="./text()"/>
                    <xsl:text> , </xsl:text>
                  </xsl:for-each>
                </td>
                <td>
                  <xsl:for-each select="./*[local-name()='Recommendations']/*[local-name()='Recommendation']">
                    <xsl:value-of select="./text()"/>
                    <xsl:text> , </xsl:text>
                  </xsl:for-each>
                </td>
              </tr>
            </xsl:for-each>
            <td>
              
            </td>
          </table>
        </body>
      </html>
    </xsl:template>
</xsl:stylesheet>
