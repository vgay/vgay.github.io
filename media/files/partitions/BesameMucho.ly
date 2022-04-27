
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Besame Mucho"
composer = #"Consuelo Velazquez"
meter = #"(Bolero)"
kwtempo = #"Medium"
kwstyle = #"Bolero"

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
  % asplayed = #"" % doit être commentée si vide
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
    \override MultiMeasureRest #'expand-limit = #2
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
  d1*2:m g:m6 g2:m6 d:9- e:m5-7 a:9- d1:m \parenthesize a:9-
  d:m d:9+ g:m6 s d1:m  b2:m5-7 e:9- a1:7 s e2:9- a:9- d1:m d:9-
  g1:m6 d:m e2:m5-7 a:9- d2:m \parenthesize d:9- g1:m6 d:m e2:7 bes:9- a1:9-
  d1*2:m g:m6 g2:m6 d:9- e:m5-7 a:9- d1:m \parenthesize a:5+9-
  d:m d:9+ g:m6 s d1:m e2:9- a:9- d1:m
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4 \mark #1
  \showStartRepeatBar \bar "[|:" \repeat volta 2 {
    d4 8 8~ 2~ | 2 \tuplet 3/2 { 4 e f } | a2 g~ | 2. r4 |
    \tuplet 3/2 { 4 4 4 } \tuplet 3/2 { a4 4 4 } |
    \tuplet 3/2 { bes4 4 4 } \tuplet 3/2 { cis d e } | a,1~ | 2 r | \break
    d4 8 8~ 2~ | 2 \tuplet 3/2 { d4 a fis } | a2 g~ | g r |
    \tuplet 3/2 { d'4 a f } \tuplet 3/2 { a f d } |
  }
  \alternative {
    {\tuplet 3/2 { f e d } \tuplet 3/2 { e d cis } | e1~ | 2 r }
    { \tuplet 3/2 { f4 e d } \tuplet 3/2 { e d cis } |d1~ | 2 r }
  }
  \bar "||" \break \mark #2
  \tuplet 3/2 { g4 g g } \tuplet 3/2 { g f e } |
  \tuplet 3/2 { f f f } \tuplet 3/2 { f e d } |
  \tuplet 3/2 { e e e } \tuplet 3/2 { e f g } | a1
  \tuplet 3/2 { g4 g g } \tuplet 3/2 { g f e } |
  \tuplet 3/2 { f f g } \tuplet 3/2 { f e d } |
  \tuplet 3/2 { e e e } \tuplet 3/2 { f f f } | e1 \bar "||" \break \mark #1
  d4 8 8~ 2~ | 2 \tuplet 3/2 { 4 e f } | a2 g~ | 2. r4 |
  \tuplet 3/2 { 4 4 4 } \tuplet 3/2 { a4 4 4 } |
  \tuplet 3/2 { bes4 4 4 } \tuplet 3/2 { cis d e } | a,1~ | 2 r | \break
  d4 8 8~ 2~ | 2 \tuplet 3/2 { d4 a fis } | a2 g~ | g r |
  \tuplet 3/2 { d'4 a f } \tuplet 3/2 { a f d } |
  \tuplet 3/2 { f e d } \tuplet 3/2 { e d cis } | d1~ | 2 r
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:" \mark #1
  \repeat percent 2 d1:m \repeat percent 2 g:m6 \break
g2:m6 d:9- e:m5-7 a:9- d1:m a:9- \break
d:m d:9+ \repeat percent 2 { g:m6 } \break
d:m \set Score.repeatCommands = #'((volta "1.") )
b2:m5-7 e:9- \repeat percent 2 { a1:7 } \break
\set Score.repeatCommands = #'((volta #f) end-repeat)
 \stopStaff s1 \startStaff \set Score.repeatCommands = #'((volta "2.") )
 e2:9- a:9- d1:m d:9- \set Score.repeatCommands = #'((volta #f)) \break \bar "||" \mark #2
 g:m6 d:m e2:m5-7 a:9- d:m d:9- \break
 g1:m6 d:m e2:7 bes:9- a1:9- \break \bar "||" \mark #1
  \repeat percent 2 { d1:m } \repeat percent 2 { g:m6 }\break
  g2:m6 d:9- e:m5-7 a:9- d1:m a:9-
d:m d:9+ \repeat percent 2 { g:m6 } \break
d1:m e2:9- a:9- \repeat percent 2 { d1:m }
  \bar ".." }



verse = \lyricmode {
  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Co -- mo si fue -- ra_es -- ta no -- che la úl -- ti -- ma vez
  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Que ten -- go mie -- do te -- ner -- te
  Per -- der -- te des -- pués
  ner -- te
  Per -- der -- te des -- pués

  Quie -- ro te -- ner -- te muy cer -- ca
  Mi -- rar -- me_en tus o -- jos
  Ver -- te jun -- to_a mí
  Pien -- sa que, tal vez, ma -- ña -- na
  Ya -- es -- ta -- ré le -- jos
  Muy le -- jos de ti

  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Co -- mo si fue -- ra_es -- ta no -- che la úl -- ti -- ma vez
  Bé -- sa -- me, bé -- sa -- me mu -- cho
  Que ten -- go mie -- do te -- ner -- te
  per -- der -- te des -- pués
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
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
    #(set-paper-size "tablette")
    page-count = #1
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
    #(set-paper-size "tablette")
    page-count = #1
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
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \addlyrics \verse
        >>
      >>
  } }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes \addlyrics \verse
        >>
      >>
  } }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes \addlyrics \verse
        >>
      >>
  } }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

%{
convert-ly (GNU LilyPond) 2.22.2  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
