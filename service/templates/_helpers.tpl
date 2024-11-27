{{/*
Expand the name of the chart.
*/}}
{{- define "service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Expand the name of the chart.
*/}}
{{- define "service.prefixedName" -}}
service-{{- include "service.name" . }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "service.labels" -}}
helm.sh/chart: {{ include "service.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "service.selectorLabels" . }}
tags.datadoghq.com/env: {{ .Values.environment }}
tags.datadoghq.com/service: {{ include "service.name" . }}
tags.datadoghq.com/source: service
tags.datadoghq.com/version: {{ .Values.image.tag }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "service.selectorLabels" -}}
app: {{ include "service.prefixedName" . }}
{{- end }}
