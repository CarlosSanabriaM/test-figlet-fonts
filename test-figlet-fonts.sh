#!/bin/bash

# Repo with all the additional fonts: https://github.com/xero/figlet-fonts

# Constants
TEXT="Vagrant VM"
declare -a FONTS=(
    # Array of strings, where each string has 2 values inside, separated using the " | " characters:
    #   "<font-name> | <font-url-suffix>"
    # An associative array cannot be used because it does not keep order

    # xx-large
    "##### xx-large ##### | ##### xx-large #####" # font-size section heading
    "Alpha.flf | Alpha.flf"
    "Doh.flf | Doh.flf"

    # x-large
    "##### x-large ##### | ##### x-large #####" # font-size section heading
    "Broadway.flf | Broadway.flf"
    "Blocks.flf | Blocks.flf"
    "Slant-Relief.flf | Slant%20Relief.flf"

    # large
    "##### large ##### | ##### large #####" # font-size section heading
    "Fraktur.flf | Fraktur.flf"
    "calgphy2.flf | calgphy2.flf"
    "Impossible.flf | Impossible.flf"
    "Electronic.flf | Electronic.flf"
    "dotmatrix.flf | dotmatrix.flf"
    "Isometric3.flf | Isometric3.flf"
    "NV-Script.flf | NV%20Script.flf"
    "amcneko.flf | amcneko.flf"
    "Chiseled.flf | Chiseled.flf"
    "amcaaa01.flf | amcaaa01.flf"
    "Delta-Corps-Priest-1.flf | Delta%20Corps%20Priest%201.flf"
    "Roman.flf | Roman.flf"
    "Univers.flf | Univers.flf"
    "Georgi16.flf | Georgi16.flf"
    "3d_diagonal.flf | 3d_diagonal.flf"
    "Crazy.flf | Crazy.flf"

    # medium
    "##### medium ##### | ##### medium #####" # font-size section heading
    "rebel.tlf | rebel.tlf"
    "mono12.tlf | mono12.tlf"
    "Merlin1.flf | Merlin1.flf"
    "amcrazor.flf | amcrazor.flf"
    "Jacky.flf | Jacky.flf"
    "flowerpower.flf | flowerpower.flf"
    "Ghost.flf | Ghost.flf"
    "Lil-Devil.flf | Lil%20Devil.flf"
    "Georgia11.flf | Georgia11.flf"
    "cosmic.flf | cosmic.flf"
    "starwars.flf | starwars.flf"
    "Marquee.flf | Marquee.flf"
    "Barbwire.flf | Barbwire.flf"
    "Diamond.flf | Diamond.flf"
    "Stellar.flf | Stellar.flf"
    "Tubular.flf | Tubular.flf"
    "Coinstak.flf | Coinstak.flf"
    "Sub-Zero.flf | Sub-Zero.flf"
    "Swamp-Land.flf | Swamp%20Land.flf"
    "block.flf | <installed-by-default>" # block.flf

    # small
    "##### small ##### | ##### small #####" # font-size section heading
    "Ghoulish.flf | Ghoulish.flf"
    "THIS.flf | THIS.flf"
    "Bloody.flf | Bloody.flf"
    "3d.flf | 3d.flf"
    "ANSI-Regular.flf | ANSI%20Regular.flf"
    "ANSI-Shadow.flf | ANSI%20Shadow.flf"
    "lineblocks.flf | lineblocks.flf"
    "Rozzo.flf | Rozzo.flf"
    "Colossal.flf | Colossal.flf"
    "Nancyj-Underlined.flf | Nancyj-Underlined.flf"
    "Poison.flf | Poison.flf"
    "Hollywood.flf | Hollywood.flf"
    "Whimsy.flf | Whimsy.flf"
    "rowancap.flf | rowancap.flf"
    "Basic.flf | Basic.flf"
    "Stronger-Than-All.flf | Stronger%20Than%20All.flf"
    "dancingfont.flf | dancingfont.flf"
    "red_phoenix.flf | red_phoenix.flf"
    "Epic.flf | Epic.flf"
    "Fender.flf | Fender.flf"
    "larry3d.flf | larry3d.flf"
    "Varsity.flf | Varsity.flf"
    "amctubes.flf | amctubes.flf"
    "Tanja.flf | Tanja.flf"
    "rev.flf | rev.flf"
    "Bright.flf | Bright.flf"

    # x-small
    "##### x-small ##### | ##### x-small #####" # font-size section heading
    "Speed.flf | Speed.flf"
    "Graffiti.flf | Graffiti.flf"
    "Chunky.flf | Chunky.flf"
    "Crawford2.flf | Crawford2.flf"
    "wetletter.flf | wetletter.flf"
    "Cyberlarge.flf | Cyberlarge.flf"
    "Cola.flf | Cola.flf"
    "dietcola.flf | dietcola.flf"
    "bigchief.flf | bigchief.flf"
    "Rounded.flf | Rounded.flf"
    "Puffy.flf | Puffy.flf"
    "Jazmine.flf | Jazmine.flf"
    "banner.flf | <installed-by-default>" # banner.flf
    "Gothic.flf | Gothic.flf"
    "The-Edge.flf | The%20Edge.flf"
    "Elite.flf | Elite.flf"
    "fire_font-k.flf | fire_font-k.flf"
    "Avatar.flf | Avatar.flf"
    "Stop.flf | Stop.flf"
    "standard.flf | <installed-by-default>" # standard.flf (default font)
    "slant.flf | <installed-by-default>" # slant.flf
    "Doom.flf | Doom.flf"
    "Bulbhead.flf | Bulbhead.flf"
    "Ogre.flf | Ogre.flf"
    "Linux.flf | Linux.flf"
    "Rectangles.flf | Rectangles.flf"
    "drpepper.flf | drpepper.flf"
    "LCD.flf | LCD.flf"
    "Swan.flf | Swan.flf"
    "Invita.flf | Invita.flf"
    "santaclara.flf | santaclara.flf"

    # xx-small
    "##### xx-small ##### | ##### xx-small #####" # font-size section heading
    "future.tlf | future.tlf"
    "emboss.tlf | emboss.tlf"
    "Calvin-S.flf | Calvin%20S.flf"
)

printLineSeparator() {
    cols=$(tput cols)
    for ((i=0; i<cols; i++));do printf "-"; done; echo
}

downloadFonts() {
    echo "ℹ️ Download fonts"
    for fontAndUrlSuffix in "${FONTS[@]}"
    do
        font=${fontAndUrlSuffix% | *}
        fontUrlSuffix=${fontAndUrlSuffix#* | }

        # Skip font-size section headings
        if [[ "$fontUrlSuffix" = "#####"* ]]; then
            continue
        fi

        # Skip fonts that are installed by default
        if [ "$fontUrlSuffix" = "<installed-by-default>" ]; then
            continue
        fi

        fontUrl="https://raw.githubusercontent.com/xero/figlet-fonts/master/$fontUrlSuffix"

        # Download font if not present
        sudo wget --quiet -nc "$fontUrl" -O "/usr/share/figlet/$font" \
            && printf "\t%s\n" "Downloaded font: $font"
    done
}

displayFonts() {
    echo "ℹ️ Test fonts"
    for fontAndUrlSuffix in "${FONTS[@]}"
    do
        font=${fontAndUrlSuffix% | *}
        fontUrlSuffix=${fontAndUrlSuffix#* | }

        # Print font-size section headings
        if [[ "$font" = "#####"* ]]; then
            fontSizeSectionHeading=$(echo "$font" | cut -d' ' -f 2)

            printLineSeparator
            figlet -t "$fontSizeSectionHeading"
            printLineSeparator

            continue
        fi

        # Print font
        printLineSeparator
        echo "$font"
        printLineSeparator
#        figlet -t "$TEXT" -f "$font" # print with default color
        figlet -t "$TEXT" -f "$font" | lolcat --spread 1.5 --force # print with rainbow color
    done
}

downloadFonts
displayFonts
