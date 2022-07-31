\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"
\include "BookPartPagesJAS.ly"
\include "poly-mark-engraver.ly"



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
  number-pages-per-bookpart = ##t %% à enlever si non souhaité
  print-page-total = ##t %% à enlever si non souhaité
  print-first-page-number = ##t
  tocItemMarkup = \tocItemWithDotsMarkup

}

title = #"Gregory Is Here"
composer = #"Horace Silver"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"

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
  asplayed = #"Horace Silver" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=UigJAYFn1tk"
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
  s4 b1*2:11+13 c:m11 b:11+13 c:m11 a1:m5-7 d:9- g:m7 c8:9  bes4/d es4.:m c4:7/e c1:m
  b:9+ bes s bes
  es:m7 as:7 des:7+ bes:m7 es:m7 as:7 c:m11 f:13
  b1*2:11+13 c:m11 b:11+13 c:m11 a1:m5-7 d:9- g:m7 c:7 c:m
  b:9+ bes:7+9 s
  b1*2:7+ bes:7+ b1*2:7+ bes:7+ b1*2:7+ a4:7+ bes:7+
}

voltaOne = \markup { 1. \text { & } 3.}


theNotes =  \relative c' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4 f8 as~
  \repeat volta 2 {
    \mark #1 as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 f8 as~ | \break
    as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 d8 f~ | \break
    f d~ d2. | r4 d8 f~ f d4 d8~ |
    d1~ | d2 r4 d8 f~ | \break
    f d~ d2. r4 a8 c~ c a4 a8~ | a1~
  }
  \alternative {
    { a2 r4 f'8 as \laissezVibrer }
    { a,2 \repeatTie r4 bes8 bes' }
  }
  \bar "||" \break
  \mark #2 bes1~ | bes4 as8 ges f es f g |
  as1~ | as4 ges8 f es des es f | \break
  ges1~ | \tuplet 3/2 { ges4 ges ges } \tuplet 3/2 { ges as ges } |
  f1~ | f4. r8 r4 f8 as~ \bar "||" \break
  \mark #1 as f~ f2. | r4 f8 as~ as f4 f8~ |
  f1~ | f2 r4 f8 as~ |\break
  as f~ f2. | r4 f8 as~ as f4 f8~ |
  f1~ | f2 r4 d8 f~ | \break
  f d~ d2. | r4 d8 f~ f d4 d8~ |
  d1~ | d2 r4 d8 f~ |\break
  f d~ d2. r4 a8 c~ c a4 a8~ | a1~ | 2. r4 \break  \mark \markup \box Ending
  \polyMark #'RightEndDown \markup \with-color #red "Solos on (AABA) then D.C. al Ending"
  bes1~bes c~c des~des d~d es~es
  \polyMark #'CenterDown \markup  rit.
  e4 f2.\fermata
  \bar ".."
}

VoiceTwo = \relative c' {
  \clef "treble" \time 4/4 \key bes \major
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \partial 4 f8_"sounds 1 oct. lower"  as~
  \repeat volta 2 {
    \mark #1 as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 f8 as~ | \break
    as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r2 \break
    r2 a8 as g ges~ | ges2. r4 |
    r4. f8~ f bes4 f8 | e f4 fis8~ fis4 g8 d'~ | \break
    d bes~ bes4 bes8 g bes a~ | a4 fis8 a~ a fis4 f8~ |
    f1~ }
  \alternative { { f2 r4  f8 as \laissezVibrer } { f2 \repeatTie r4 bes,8 bes'~ } }
  \break \mark #2 bes1~ | bes4 as8 ges f es f g |
  as1~ | as4 ges8 f es des es f | \break
  ges1~ | \tuplet 3/2 { ges4 ges ges } \tuplet 3/2 { ges as ges } |
  f1~ | f4. r8 r4 f8 as~ \bar "||" \break
  \mark #1 as f~ f2. | r4 f8 as~ as f4 f8~ |
  f1~ | f2 r4 f8 as~ | \break
  as f~ f2. | r4 f8 as~ as f4 f8~ |
  f1~ | f2 r2 \break
  r2 a8 as g ges~ | ges2. r4 |
  r4. f8~ f bes4 f8 | e f4 fis8~ fis4 g8 d'~ | \break
  d bes~ bes4 bes8 g bes a~ | a4 fis8 a~ a fis4 f8~ |
  f1~ | f2. r4 \bar "||" \break
  \mark \markup \box Ending
  \polyMark #'RightEndDown \markup \with-color #red "Solos on (AABA) then D.C. al Ending"
  ges1~ges a~a bes~bes a~a bes~bes
  \polyMark #'CenterDown \markup  rit.
  gis4 as2.\fermata
  \bar ".."
}




Voicing = \relative c'' {
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \clef "treble" \time 4/4 \key bes \major
  \new Voice \with {
    \consists "Pitch_squash_engraver"
  }
  {
    \partial 4 r4 \mark #1 \repeat volta 2 {
      f4 _"Top note of voicing" 8-. 8~ 8 4 8~ | 4. 8-. 4 4 | f4  8-. 8~ 8 4 8~ | 4. 8-. 4 4 | \break
      \repeat unfold 2 { f4  8-. 8~ 8 4 8~ | 4. 8-. 4 4 } \break
      \override TextSpanner.bound-details.left.text = "with tenor"
      \textSpannerDown
      \override TextSpanner #'extra-offset = #'( 0 . 1 )
      d2 r8 \startTextSpan a as g | fis1 |
      f!2~ 8 bes f e~ e f4 ges8~ 4  \stopTextSpan <e g>8 <bes' d>~ | \break
      q <g bes>8~ q2 q8 <a d>~ | q1 | r8 _"Top note" c'8 c c~ c a-. a a~
    }
    \alternative { { a f-. f f~ f2 }  { a8 \repeatTie f-. f f~ f2 } } \break
    \mark #2 \comp #16 \break \comp #8 |
    \improvisationOn r8 b4 8~ 8 4 8 4 4 r2 ^"dr. fill--" \improvisationOff
    \bar "||" \break \mark #1
    f4 _"Top note of voicing" 8-. 8~ 8 4 8~ | 4. 8-. 4 4 | f4  8-. 8~ 8 4 8~ | 4. 8-. 4 4 | \break
    \repeat unfold 2 { f4  8-. 8~ 8 4 8~ | 4. 8-. 4 4 } \break
    d2 r8 \startTextSpan a as g | fis1 |
    f!2~ 8 bes f e~ e f4 ges8~ 4  \stopTextSpan <e g>8 <bes' d>~ | \break
    q <g bes>8~ q2 q8 <a d>~ | q1 | r8 _"Top note" c'8 c c~ c a-. a a~
    a f-. f f~ f2 \bar "||" \break
    \mark \markup \box Ending
    \polyMark #'RightEndDown \markup \with-color #red "Solos on (AABA) then D.C. al Ending"
    \repeat unfold 3 { \improvisationOn r8 b4 8~ 8 4 8~ | 4 r8 8 4 4 } \break
    \repeat unfold 2 { \improvisationOn r8 b4 8~ 8 4 8~ | 4 r8 8 4 4 }
    \polyMark #'CenterDown \markup  rit.
    4 2. \fermata \bar ".."
} }

Basse = \relative c {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \clef "bass" \key bes \major \time 4/4
  \partial 4 r4 \mark #1
  \repeat volta 2 {
    \repeat unfold 2 { b4. fis'8~ 4. b8~ | 4. fis8~ 2 | c4. g'8~ 4. c8~ | 4. g8~ 2 | \break  }
    a4. 8~ 4 4 | d,4. 8~ 4 4 | g4. 8~ 4. c,8~ | c8 d4 es8~ 4 e4  | \break
    c4. g'8 4 c8 g | b,4. fis'8~ 4 b8 fis | bes,4. f'8~ 8 a b f |
  }
  \alternative { { bes,4. a8~ 8 as g f } { bes4. 8~4 4 } } \bar "||" \break \mark #2
  es4. es'8~ 8 des bes a | as4. 8~ 4 es8 d | des4. as8~ 4 a | bes4. f'8~ 8 as bes f | \break
  es4. es'8~ 4 bes4 |as4. 8  2 | r8 c,4 8~ 8 4 8 | f4 4 r2 \break \bar "||" \mark #1
  b,4. fis'8~ 4. b8~ | 4. fis8~ 2 | c4. g'8~ 4. c8~ | 4. g8~ 2 | \break
  b,4. fis'8~ 4. b8~ | 4. fis8~ 2 | c4. g'8~ 4. c8~ | 4. g8~ 2 | \break
  a4. 8~ 4 4 | d,4. 8~ 4 4 | g4. 8~ 4 4 | c,8 d4 es8~ 8 f4 c8~ | \break
  c4. g'8 4 c8 g | b,4. fis'8~ 4 b8 fis |
  bes,4. f'8~ 8 a b f | bes,4. f'8~ 8 a b f \break
  \mark \markup \box Ending
  \polyMark #'RightEndDown \markup \with-color #red "Solos on (AABA) then D.C. al Ending"
  \repeat unfold 2 { b,4. fis'8~ 4. b8~ | 2 fis4 b | bes,4. f'8~ 4. bes8~ | 2 f4 bes | }
  \break b,4. fis'8~ 4. b8~ | 2 fis4 b |
  \polyMark #'CenterDown \markup  rit.
  a,4 bes2.\fermata
  \bar ".."
}

grille = \chordmode {
  %\override Score.RehearsalMark #'self-alignment-X = #LEFT
  \bar "[|:" \mark #1
  \repeat volta 2 {
    \repeat unfold 2 { \repeat percent 2 { b1:11+13 } \repeat percent 2 { c:m11 }  \break }
    a:m5-7 d:9- g:m7 c4:9 bes/d es:m c:7 \break
    c1:m9 b:9+ \repeat percent 2 { bes:7+9 }  }
  \mark #2 es1:m7 as:7 des:7+ bes:m7 \break
  es1:m7 as:7 c:m11 f:13 \break \bar "||" \mark #1
  \repeat unfold 2 { \repeat percent 2 { b1:11+13 } \repeat percent 2 { c:m11 }  \break }
  a:m5-7 d:9- g:m7
  c4:9 bes/d es:m c:7 \break
  c1:m9 b:9+ \repeat percent 2 { bes:7+9 } \bar "||-[|:"
  \break   \mark \markup \box Ending
  \repeat volta 2 { \repeat percent 2 { b:7+ } \repeat percent 2 { bes:7+ } } \break
  \repeat percent 2 { b:7+ } a4:7+ bes2.:7+ \fermata \bar ".." \stopStaff s1 \bar ""
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {C " Version"} }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Trumpet)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            "(Horn 1)"
        } }
        \theNotes      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            "(Horn 2)"
        } }
        \VoiceTwo      >>
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #10 { \circle \bold \concat {" " B \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {B \flat " Version"} }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Trumpet)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }
    \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            Trumpet
        } }
        \transpose c d \theNotes      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            "T. Sax"
        } }
        \transpose c d \VoiceTwo  >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #10 { \circle \bold \concat {" " E \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {E \flat " Version"} }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Trumpet)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }
    \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            "(Horn 1)"
        } }
        \transpose c a \theNotes      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            "(Horn 2)"
        } }
        \transpose c a \VoiceTwo  >>
    }
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
    print-page-number = ##f
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {C " Version"} }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Trumpet)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Chord Grid } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }
  \bookpart {
    \tocItem \markup "Horn I (trumpet)"
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            "(Horn 1)"
        } }
        \theNotes      >>
    }
  }  \bookpart {
    \tocItem \markup "Horn II (Tenor Sax.)"
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
            "(Horn II)"
        } }
        \VoiceTwo      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      <<
% \new RhythmicStaff \with {
%     \improvisationOn
%     \override StaffSymbol.line-count = 0
%     \remove Time_signature_engraver
%     \remove Bar_engraver
%   }
%   {  s1*10 s2.. c8~ 8 4 8~ 4 4}
  \new ChordGrid \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #10 { \circle \bold \concat {" " B \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {B \flat " Version"} }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Trumpet)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Chord Grid } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            Trumpet
        } }
        \transpose c d \theNotes      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
            "T. Sax"
        } }
        \transpose c d \VoiceTwo  >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #10 { \circle \bold \concat {" " E \flat " "} }
        \vspace #1
        \fill-line \fontsize #4 { \concat {E \flat " Version"} }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Horn I \fontsize #-2 "(Trumpet)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Horn II \fontsize #-2 "(Tenor Sax)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Chord Grid } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            "(Horn 1)"
        } }
        \transpose c a \theNotes      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
            "(Horn 2)"
        } }
        \transpose c a \VoiceTwo  >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "RSa4")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        \vspace #1
        \fill-line \fontsize #4 { "for Rhythm Section" }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Piano voicing \fontsize #-2 "(top notes)" } }
          \vspace #0.3
          \page-link #3 \line  {  \hspace #10 \underline { Bass  } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Chord Grid } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            Piano Voicing
        } }
        \Voicing      >>
    }
  }  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            Bass
        } }
        \Basse      >>
    }
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
  }
  #(define output-suffix "RSTab")
  \bookpart {
    \paper {
      print-first-page-number = ##f
    }
    \markup {
      \column {
        \vspace #3
        \fill-line { \fontsize #9 "Gregory Is Here" }
        \fill-line \fontsize #3 { "Music from Horace Silver" }
        \vspace #2
        \fill-line  \fontsize #6 { \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "} }
        \vspace #1
        \fill-line \fontsize #4 { "for Rhythm Section" }
        \vspace #2
        \fontsize #4 {
          \page-link #2 \line  {  \hspace #10 \underline { Piano voicing \fontsize #-2 "(top notes)" } }
          \vspace #0.3
          \page-link #4 \line  {  \hspace #10 \underline { Bass  } }

          \vspace #1
          \override #'(line-width . 120)
          \fill-line { " " "Lilypond sources embeded in this pdf file" }
        }
      }
    }
  }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            Piano Voicing
        } }
        \Voicing      >>
    }
  }  \bookpart {
    \paper { page-count = #2
    ragged-last-bottom =  ##f
    }
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with {
          instrumentName = \markup \center-column
          {
            Bass
        } }
        \Basse      >>
 } } }