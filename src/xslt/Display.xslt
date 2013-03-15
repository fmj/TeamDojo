<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
      <html>
        <body>
          <table>
            <th>
              <tr>Programmers</tr>
              <tr>Skills</tr>
              <tr>Recommends</tr>
            </th>
            <xsl:for-each select="/*[local-name()='Network']/*[local-name()='Programmer']">
              <td>
                <tr>
                  <xsl:value-of select="./@name"/>
                </tr>
                <tr>
                  <xsl:for-each select="./*[local-name()='Skills']">
                    <xsl:value-of select="./*[local-name()='Skill']"/>
                  </xsl:for-each>
                </tr>
                <tr>
                  <xsl:for-each select="./*[local-name()='Recommends']">
                    <xsl:value-of select="./*[local-name()='Recommend']"/>
                  </xsl:for-each>
                </tr>
              </td>
            </xsl:for-each>
            <td>
              
            </td>
          </table>
        </body>
      </html>
    </xsl:template>
</xsl:stylesheet>
