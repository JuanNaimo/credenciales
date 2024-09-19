# Script para eliminar las credenciales de GitHub desde el Administrador de Credenciales de Windows

# Define el target que queremos buscar
$githubCredentialTarget = "git:https://github.com"

# Buscar las credenciales de GitHub en el Administrador de Credenciales
$credentials = cmdkey /list | Select-String $githubCredentialTarget

if ($credentials) {
    # Si se encuentran las credenciales de GitHub, las eliminamos
    cmdkey /delete:$githubCredentialTarget
    Write-Host "Credenciales de GitHub eliminadas exitosamente."
} else {
    Write-Host "No se encontraron credenciales de GitHub almacenadas."
}