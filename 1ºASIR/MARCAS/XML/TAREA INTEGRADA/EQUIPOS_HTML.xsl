<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body style="background-image: url(./wallpaper);background-repeat:no-repeat;background-size: cover;">
  <h1 style="text-decoration:underline; color:white;">EQUIPOS</h1>
  <table border="2">
    <tr bgcolor="#FFAA33">
      <th style="text-align:center">ID</th>
      <th style="text-align:center">NOMBRE</th>
      <th style="text-align:center">NACIONALIDAD</th>
      <th style="text-align:center">NUMERO DE JUGADORES</th>
      <th style="text-align:center">ENTRENADORES</th>
    </tr>
    <xsl:for-each select="EQUIPOS/EQUIPO">
    <tr bgcolor="FFC933">
      <td style="text-align:center; width:50px"><xsl:value-of select="ID_EQUIPO"/></td>
      <td style="text-align:center"><xsl:value-of select="NOMBRE_EQUIPO"/></td>
      <td style="text-align:center"><xsl:value-of select="NACIONALIDAD"/></td>
      <td style="text-align:center"><xsl:value-of select="NUM_JUGADORES"/></td>
      <xsl:for-each select="ENTRENADORES">
        <td style="width:230px; padding-top:15px;">
            <ul>
            <li>DNI: <xsl:value-of select="DNI_ENTRENADOR"/></li>
            <li>ALIAS: <xsl:value-of select="ALIAS"/></li>
            <li>TELEFONO: <xsl:value-of select="TELEFONO"/></li>
            </ul>
        </td> 
      </xsl:for-each>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>