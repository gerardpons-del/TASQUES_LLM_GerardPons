<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <clientes>
      <xsl:for-each select="DATA/ROW">
        <cliente>
          <numero_cliente><xsl:value-of select="customerNumber"/></numero_cliente>
          <nombre_empresa><xsl:value-of select="customerName"/></nombre_empresa>
          <contacto>
            <nombre><xsl:value-of select="contactFirstName"/></nombre>
            <apellido><xsl:value-of select="contactLastName"/></apellido>
            <telefono><xsl:value-of select="phone"/></telefono>
          </contacto>
          <direccion>
            <linea1><xsl:value-of select="addressLine1"/></linea1>
            <xsl:if test="addressLine2 != 'NULL'">
              <linea2><xsl:value-of select="addressLine2"/></linea2>
            </xsl:if>
            <ciudad><xsl:value-of select="city"/></ciudad>
            <xsl:if test="state != 'NULL'">
              <estado><xsl:value-of select="state"/></estado>
            </xsl:if>
            <codigo_postal><xsl:value-of select="postalCode"/></codigo_postal>
            <pais><xsl:value-of select="country"/></pais>
          </direccion>
          <representante_ventas>
            <xsl:choose>
              <xsl:when test="salesRepEmployeeNumber != 'NULL'">
                <xsl:value-of select="salesRepEmployeeNumber"/>
              </xsl:when>
              <xsl:otherwise>No asignado</xsl:otherwise>
            </xsl:choose>
          </representante_ventas>
          <limite_credito><xsl:value-of select="creditLimit"/></limite_credito>
        </cliente>
      </xsl:for-each>
    </clientes>
  </xsl:template>
  
</xsl:stylesheet>