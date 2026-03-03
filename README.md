# Asena's File Organizer

A simple Windows batch script that automatically sorts your Downloads folder into clean, categorised subfolders with duplicate detection, failure logging, and size-based sorting.

## Features

- **Automatic file sorting** - routes files into named folders based on extension
- **Duplicate detection** - moves files that already exist in `Duplicates\` instead of overwriting
- **Change logging** - every action (moved, duplicate, failed) is written to `changelog.txt`
- **Size-based sort** - unrecognised files are sorted into `SmallFiles`, `MediumFiles`, or `LargeFiles`
- **Move failure detection** - logs `[FAILED]` if a file cannot be moved (e.g. locked or permission denied)
- **Self-protection** - skips the script itself and the log file during sorting

## Folder Structure

After running, your Downloads folder will contain:

```
Downloads/
├── Images/          # jpg, png, gif, heic, psd, raw, svg, ai ...
├── Documents/       # pdf, docx, xlsx, pptx, txt, csv, md ...
├── Videos/          # mp4, mkv, mov, avi, webm, flv, vob ...
├── Audio/           # mp3, flac, wav, aac, ogg, opus, midi ...
├── Archives/        # zip, rar, 7z, tar, iso, dmg, gz ...
├── Ebooks/          # epub, mobi, azw3, djvu, cbz, fb2 ...
├── Code/            # py, js, ts, html, css, sql, json, sh ...
├── Executables/     # exe, msi, apk, deb, rpm, dll ...
├── TempCleanup/     # tmp, bak, old, .part, .crdownload ...
├── Duplicates/      # files already found in Duplicates\
├── SmallFiles/      # unrecognised files under 1 MB
├── MediumFiles/     # unrecognised files between 1 MB and 100 MB
├── LargeFiles/      # unrecognised files over 100 MB
└── changelog.txt    # full run log
```

## Usage

1. Download `organizer.bat` and place it anywhere, including inside your Downloads folder
2. Double-click to run, or launch from Command Prompt:
3. Check `changelog.txt` for a full record of what was moved.

> The script targets `C:\Users\%USERNAME%\Downloads' by default.` No installation required.

## Configuration

To change the target folder, edit this line near the top of the script:

`set "SOURCE=C:\Users\%USERNAME%\Downloads"`

Replace it with any absolute path, for example:

`set "SOURCE=D:\MyFiles\Unsorted"`

## Log Format

Every run appends to `changelog.txt` in the source folder:

```
[03/03/2026 14:22:01] Organizer Started
[MOVED]      photo.jpg         ->  Images
[MOVED]      invoice.pdf       ->  Documents
[DUPLICATE]  setup.exe
[FAILED]     locked_file.zip   ->  Archives
[03/03/2026 14:22:03] Organizer Finished
```

## Supported Extensions

| Category    | Extensions                                                                                     |
|-------------|-----------------------------------------------------------------------------------------------|
| Images      | `.jpg` `.jpeg` `.png` `.gif` `.bmp` `.webp` `.heic` `.heif` `.tiff` `.raw` `.cr2` `.cr3` `.nef` `.arw` `.dng` `.svg` `.psd` `.ai` `.eps` `.xcf` `.avif` |
| Documents   | `.pdf` `.doc` `.docx` `.txt` `.rtf` `.odt` `.xlsx` `.xls` `.pptx` `.ppt` `.csv` `.xml` `.md` `.tex` `.wps` `.wpd` |
| Videos      | `.mp4` `.mkv` `.avi` `.mov` `.wmv` `.flv` `.webm` `.m4v` `.3gp` `.mts` `.vob` `.ogv` `.rmvb` `.divx` `.asf` |
| Audio       | `.mp3` `.flac` `.wav` `.aac` `.ogg` `.wma` `.m4a` `.opus` `.aiff` `.mid` `.midi` `.ape` `.mka` |
| Archives    | `.zip` `.rar` `.7z` `.tar` `.gz` `.bz2` `.xz` `.tgz` `.cab` `.iso` `.img` `.dmg` `.zst`      |
| Ebooks      | `.epub` `.mobi` `.azw` `.azw3` `.djvu` `.fb2` `.lit` `.cbz` `.cbr`                           |
| Code        | `.py` `.js` `.ts` `.html` `.css` `.cpp` `.c` `.cs` `.java` `.go` `.rs` `.php` `.rb` `.sh` `.bat` `.ps1` `.json` `.yaml` `.sql` `.vue` `.jsx` `.tsx` `.dart` |
| Executables | `.exe` `.msi` `.msix` `.apk` `.ipa` `.deb` `.rpm` `.pkg` `.dll` `.sys` `.bin`                |
| TempCleanup | `.tmp` `.temp` `.bak` `.old` `.crdownload` `.part` `.cache`                                   |

## Notes

- The script only processes **root-level files** in the source folder — subfolders are not touched
- Files are **moved**, not copied — originals are removed from the source
- Running the script multiple times is safe — already-sorted files in subfolders are ignored
- If a file cannot be moved (locked, permissions), it stays in place and is logged as `[FAILED]`

## Requirements

- Windows 7 or later
- No dependencies or installs needed — pure batch file

## License

Free to use, modify, and distribute.