\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Un Homme et une Femme"
composer = #"Francis Lai"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"
kwfrench = #"Oui"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
r2. c1:7+ s1. b1:7 s1.bes1:7+ s1. e1:m7 a:7 d:7+ s4 r2. d1:7+
c:m7 f:9- bes:7+ s c:m7 f:9- bes:6 s e:m7 a:7 d:7+ s d:m7 g:7 c:7+ s
c1:7+ s1. b1:7 s1.bes1:7+ s1. e1:m7 a:7 d:7+ s4 r2.
d1:7+ s e:m7 a:7 d:7+ s e:m7 s
d2.:7+ s s4. des:7+ c2.:7+ s  s4. des:7+ d2.:7+

}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
    \override Tie.layer = #-2
  \partial 2. g4 \fermata a \fermata bes \fermata \AetS
  \repeat volta 2 {
    b8 8 8 8 4 8 8 | \time 6/4 8 8 2 a4 b c | \time 4/4
    b8 8 8 8 4 8 8 | \time 6/4 8 8 2 a4 b c | \time 4/4
    a8 8 8 8 4 8 8 | \time 6/4 8 8 2 g4 a bes | \time 4/4
    a2 2~ | 4 g g a | \Coda fis1 }
  \alternative {
    { r4 g4  a  bes  }
    { r g a bes }
  }
  \bar "||" \break \mark #2
  d1~ | 2 c4. bes8 | c2 2~ | 2 bes4. a8 | bes2. g4 | c, d es a | g1~ | 1 | \break
  g2 2~ | 2 b4. a8 | fis2 2~ | 2 a8 as g ges | f!2 2~ | 2 a4. g8 | es1
  r4 g4  a  bes   \bar "||" \break \mark #1
  b8 8 8 8 4 8 8 | \time 6/4 8 8 2 a4 b c | \time 4/4
  b8 8 8 8 4 8 8 | \time 6/4 8 8 2 a4 b c | \time 4/4
    a8 8 8 8 4 8 8 |  \time 6/4 8 8 2 g4 a bes | \time 4/4
  a2 2~ | 4 g g a | gis1 | r4 g  a  bes  |
  \break \DSalCoda \bar "|."
  fis1~ | 1 | g2 2~ | 4 4 4 a | fis1~ | 1 | g2 2~ | 4 4 b d | \break
  \time 3/4 \repeat volta 2 {
    cis8 8 8 8 4 | 8 8 8 8 4 | 4. c | b 8 8 8 8 4 | 8 8 8 8 4 | b4. c }
  cis4 r r  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

verse = \lyricmode {
Com -- me nos voix ba da ba da da da da da da
Chan -- tent tout bas ba da ba da da da da da da
Nos cœurs y voient ba da ba da da da da da da
Comme u -- ne chan -- ce __ comme un es -- poir
Com -- me nos \repeat unfold 3 { \skip 1 }

 joies __
Bien des dra -- mes __
Et voi -- là!
C'est u -- ne longue his -- toire __
Un homme __
U -- ne fem -- me __
Ont for -- gé la tra -- me __  du ha -- sard.

Com -- me nos voix ba da ba da da da da da da
Nos cœurs y voient ba da ba da da da da da da
En -- core une fois ba da ba da da da da da da
Comme un -- e chan -- ce
Comme un es -- poir.

Com --me nos

là. __


 Chan -- ce __ qui pas -- sait là
Chan -- ce pour toi et moi ba da ba da da da da da da
Toi et moi ba da ba da da da da da da
Toi et moi.
}

verseB = \lyricmode {
  \repeat unfold 3 { \skip 1 } voix ba da ba da da da da da da
Nos cœurs y croient ba da ba da da da da da da
En -- core une fois ba da ba da da da da da da
Tout re -- com -- men -- ce, __ la vie re -- part
\repeat unfold 3 { \skip 1 } Com -- bien de
}
verseC = \lyricmode {
\repeat unfold 3 { \skip 1 }  voix ba da ba da da da da da da
Nos cœurs en joie ba da ba da da da da da da
On fait le choix ba da ba da da da da da da
D'u -- ne ro -- man -- ce __
Qui pas -- sait
}
verseD  = \lyricmode { \repeat unfold 3 { \skip 1 } "  "
           \repeat unfold 28 { \skip 1 } "  "
}


\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
   print-first-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          \new Voice = "mel"
          \theNotes
        >>
        \new Lyrics \lyricsto "mel" \verse
        \new Lyrics \lyricsto "mel" \verseB
        \new Lyrics \lyricsto "mel" \verseC
        \new Lyrics \lyricsto "mel" \verseD
      >>

    }
}}