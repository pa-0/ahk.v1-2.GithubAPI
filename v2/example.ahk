﻿;using this repo as an example: https://github.com/samfisherirl/Github.ahk-API-for-AHKv2
;credit: https://github.com/TheArkive/JXON_ahk2
;credit: https://github.com/thqby/ahk2_lib

#Include %A_ScriptDir%\lib\github.ahk

git := Github("samfisherirl", "Github.ahk-API-for-AHKv2")
; object := Gitub(Username, Repository)

ar := git.releaseURLArray()
for downloadLink in ar
{
    MsgBox(downloadLink)
}
m := git.releaseURLMap()
for fileName, downloadLink in m
{
    if InStr(fileName, "v2") {
        MsgBox(fileName "`n" downloadLink)
        Download(downloadLink, A_ScriptDir)
        break
    }
}
;object.Download("localpath", OptionalURL := http://github.com....AssetUrl.zip)
;Downloads the first, latest release file
; Releases have designated extensions (zip/exe)
; if a mismatch is provided, the method will overwrite the users extension.

; just a name can be passed. extension will be handled.
; this will get saved to A_ScriptDir

git.Source(A_ScriptDir "\main.zip")
; download main branch source code

; Multiple Assets use-case
; enumerate ==ALL Historic Releases==
repo_string := ""
for repo in git.historicReleases() {
    /*  downloadURL: "",
        version: "",
        body: "",
        date: "",
        name: ""  */
    repo_string .= repo.name " version " repo.version " was released on " repo.date "`nUpdate notes: `n" 
    repo_string .= repo.change_notes "`nDownload Link: " repo.downloadURL "`n`n"
}
MsgBox(repo_string)

URL := git.searchReleases("v2")
; InStr search through each Release name first, then falls back on URL.
; First match returns the url for Download, then use that below:
git.Download("path.zip", URL)

/*
Latest version, great for storing and checking for updates.
*/
