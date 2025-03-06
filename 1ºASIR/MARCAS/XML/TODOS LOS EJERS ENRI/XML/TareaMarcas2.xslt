<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html> 
      <body>
        <h2 style="padding-left:45%">MIS TORNEOS</h2>
        <table border="1" style="background-color:#CCCCCC;margin-left:25%">
          <tr bgcolor="#CCCCCC">
            <th style="text-align:center">ID_TORNEO</th>
            <th style="text-align:center">COD_ZONA</th>
            <th style="text-align:center">JUEGO</th>
            <th style="text-align:center">HORARIO</th>
            <th style="text-align:center">CLASIFICACION</th>
            <th style="text-align:center">DURACION</th>
          </tr>
          <xsl:for-each select="/TORNEOS/TORNEO">
            <tr>
              <td  style="text-align:center"><xsl:value-of select="ID_TORNEO"/></td>
              <td  style="text-align:center"><xsl:value-of select="COD_ZONA"/></td>
              <td><xsl:value-of select="NOMBRE_JUEGO"/></td>
          
              <ul style="padding-top:10px">
                <xsl:for-each select="JUEGO">
                    <li><xsl:value-of select="NOMBRE_JUEGO"/></li>
                    <li><xsl:value-of select="DESARROLLADOR"/></li>
                    <li><xsl:value-of select="TIPO"/></li>
                    <li><xsl:value-of select="DESCRIPCION"/></li>
                </xsl:for-each>
              </ul>
              
              <td  style="text-align:center"><xsl:value-of select="HORARIO"/></td>
              <td  style="text-align:center"><xsl:value-of select="CLASIFICACION"/></td>
              <td  style="text-align:center"><xsl:value-of select="DURACION"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
