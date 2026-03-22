<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <pagos>
      <xsl:for-each select="DATA/ROW">
        <pago>
          <cliente>
            <numero_cliente><xsl:value-of select="customerNumber"/></numero_cliente>
            <nombre_empresa><xsl:value-of select="customerName"/></nombre_empresa>
            <contacto>
              <xsl:value-of select="concat(contactFirstName, ' ', contactLastName)"/>
            </contacto>
            <pais><xsl:value-of select="country"/></pais>
          </cliente>
          <informacion_pago>
            <numero_cheque><xsl:value-of select="checkNumber"/></numero_cheque>
            <fecha_pago><xsl:value-of select="paymentDate"/></fecha_pago>
            <importe><xsl:value-of select="amount"/></importe>
          </informacion_pago>
        </pago>
      </xsl:for-each>
      <resumen>
        <total_pagos>
          <xsl:value-of select="sum(DATA/ROW/amount)"/>
        </total_pagos>
        <numero_transacciones>
          <xsl:value-of select="count(DATA/ROW)"/>
        </numero_transacciones>
      </resumen>
    </pagos>
  </xsl:template>
  
</xsl:stylesheet>