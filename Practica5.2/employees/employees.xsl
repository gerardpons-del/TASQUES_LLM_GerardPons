<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <empleados>
      <xsl:for-each select="DATA/ROW">
        <empleado>
          <numero_empleado><xsl:value-of select="employeeNumber"/></numero_empleado>
          <nombre_completo>
            <xsl:value-of select="concat(firstName, ' ', lastName)"/>
          </nombre_completo>
          <email><xsl:value-of select="email"/></email>
          <extension><xsl:value-of select="extension"/></extension>
          <puesto><xsl:value-of select="jobTitle"/></puesto>
          <jefe>
            <xsl:choose>
              <xsl:when test="reportsTo != 'NULL'">
                <xsl:value-of select="reportsTo"/>
              </xsl:when>
              <xsl:otherwise>Sin jefe</xsl:otherwise>
            </xsl:choose>
          </jefe>
          <oficina>
            <codigo_oficina><xsl:value-of select="ofCode"/></codigo_oficina>
            <ciudad><xsl:value-of select="ofCity"/></ciudad>
            <pais><xsl:value-of select="ofCountry"/></pais>
            <telefono_oficina><xsl:value-of select="ofPhone"/></telefono_oficina>
            <direccion>
              <xsl:value-of select="ofAdd1"/>
              <xsl:if test="ofAdd2 != 'NULL'">
                <xsl:value-of select="concat(', ', ofAdd2)"/>
              </xsl:if>
            </direccion>
            <codigo_postal><xsl:value-of select="ofPostalCode"/></codigo_postal>
            <territorio><xsl:value-of select="ofTerritory"/></territorio>
          </oficina>
        </empleado>
      </xsl:for-each>
    </empleados>
  </xsl:template>
  
</xsl:stylesheet>