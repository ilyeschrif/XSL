<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="totalSolde">
		<xsl:value-of
			select="sum(BanqueService/getComptes/solde)"></xsl:value-of>
	</xsl:variable>

	<xsl:variable name="totalSoldeFiltré">
		<xsl:value-of
			select="sum(BanqueService/getComptes[substring(dateCreation, 1, 4) > 2000]/solde)"></xsl:value-of>
	</xsl:variable>


	<xsl:template match="/">
		<html>
			<head>
				<title>Liste des Comptes</title>
			</head>
			<body>
				<h1>Liste des comptes</h1>
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de Création</th>
					</tr>

					<xsl:for-each select="//getComptes">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="dateCreation" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>
					la somme est :
					<xsl:value-of select="$totalSolde"></xsl:value-of>
				</p>
				<h1>Liste des comptes > 2000</h1>
				<table border="1">
					<tr>
						<th>Code</th>
						<th>Solde</th>
						<th>Date de Création</th>
					</tr>

					<xsl:for-each
						select="//getComptes[substring(dateCreation, 1, 4) > 2000]">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="dateCreation" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>
					solde total :
					<xsl:value-of select="$totalSoldeFiltré"></xsl:value-of>
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
