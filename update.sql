UPDATE alert
SET settings = JSON_SET(settings, '$.conditions[0].query.datasourceId', (SELECT MAX(id) FROM data_source))
WHERE JSON_EXTRACT(settings, '$.conditions[0].query.datasourceId') IS NOT NULL
	AND JSON_EXTRACT(settings, '$.conditions[0].query.datasourceId') != (SELECT MAX(id) FROM data_source)