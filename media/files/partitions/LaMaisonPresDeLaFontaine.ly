\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 18)
                            (minimum-distance . 8)
                            (padding . 5))
}

title = #"La maison près de la fontaine"
composer = #"Nino Ferrer"
meter = #"(Mod. Slow Swing)"
kwtempo = #"Mod. Slow"
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
    %voltaSpannerDuration = #(ly:make-moment 4 4)
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
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
    % à remplacer par \autoLineBreaksOff et \autoBreaksOff
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
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

\defineBarLine "||-[|:" #'("||" "[|:" "[|:")

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

voltaAdLib = \markup { \fontsize #2 \bold \text "ad lib." }
voltaOnCue = \markup \fontsize #3 \bold  \text "Last X"


harmonies = \chordmode {
  \set chordChanges = ##f
  r1*4 f2:m f:m7+/e f:m7/es f:m6/d des f:7/c bes:m s c:7 bes:m as:dim7 c:7/g
  f1:m bes:m7 es:7 as:7+ des:7+ g:7
  c2 c:7/bes c:5+/as c/g e1 e:7 f:6 f e e:7 c:9 s f s
  a1 s2. fis4:7 b2 b:7+/ais b:7/a b:6/gis b2 b:7+/ais b:7/a b:6/gis
  g1:m7 c:9 c:5+7 c:9+ c:5+/as c/g
  f1:m c:9+ f:m c:9+ r1*4
}



theNotes =  \relative c' {
  \clef "treble" \key as \major \time 4/4
  \oneVoice
  R1*3 r2 r4 f8 as \mark #1
  \repeat volta 2 {
    c2 bes8 as c bes | as4 r8 g f g as c | f4 f8 f es f es des~ | 4 r8 c bes c des bes | \break
    c4 c bes bes | as as g8 as g f~ | 2 r | r4 f' es des  | \break
    R1 | r4 es des c | R1 | r4 d c b |  c1~  }
  \alternative {
    {
      \overrideProperty Score.VoltaBracket.text \voltaAdLib
      4 r r r8 c8 \bar "||" \break \set Score.repeatCommands = #'((volta #f)) \mark #2
      \key c \major
      b4 r bes8 b~ b e~ | 4 r d e | d1 | c4 r r r8 c | \break
      b4 r bes8 b~ b e~ | 4 r d e | d1~ | 4 r r r8 c, | \break
      a'4 a g g | f r8 f e f g f | a4 a e e | a r r r8 fis | \break
      b4 b ais ais | a!8 a4 gis8 ~ gis4 r8 fis | b4 4 ais8~ 4 a8~ | 4 r gis8 a gis g~ | \break
      1 | R1| R1 | r2 r4 f8 a \pageBreak
    }
    {
      \overrideProperty Score.VoltaBracket.text \voltaOnCue
      \key as \major c4 \repeatTie r8 c, as'8 4.}
  }
  f4 r r2 | r4 r8 c8 as'8 4. | f4 r r2 | \break r4 r8 c8 as'8 4. | f4 r r2 | R1*4

  \bar ".."
}

voiceII = \relative c {
  \clef "treble_8" \key as \major \time 4/4
  R1*10 r4 f8 as c4 bes8 as | \tuplet 3/2 { c bes as~ } as4 r2 |
  r4 \tuplet 3/2 { g8 as a } bes b c es | c4 r r2 |
  r4 es8 c \tuplet 3/2 { es4 es f, } | b2 r |
  c8 g' c, bes~ bes g' bes, as~ | as g' as, g~ g2 \key c \major
  R1 R1 r4 \tuplet 3/2 { g'8 gis a } g f c a | g f c f a d4 c8 | b4 r4 r2 | R1 |
  r4 e \tuplet 3/2 { d8 c bes } \tuplet 3/2 { g e d } | c4. d8~ 4 e | f-. r r2
  R1*7 | \tuplet 3/2 { r8 c' d } \tuplet 3/2 { g d c } \tuplet 3/2 { bes c d } \tuplet 3/2 { g d c }  |
  \tuplet 3/2 { bes c d } \tuplet 3/2 { g d c } \tuplet 3/2 { bes c d } \tuplet 3/2 { g d c } |
  \tuplet 3/2 { bes c d } \tuplet 3/2 { gis d c } \tuplet 3/2 { bes c d } \tuplet 3/2 { gis d c } |
  bes2 r \key as \major
  r4 r8 c, as'8 4. | f4 r r2 | r4 r8 c8 as'8 4. | f4 r r2 | r4 r8 c8 as'8 4. | f4 r r2 | R1*4


}

voiceIII = \relative c {
  \clef "treble_8" \key as \major \time 4/4
  R1*10 r4 f8 as c4 bes8 as | \tuplet 3/2 { c bes as~ } as4 r2 |
  r4 \tuplet 3/2 { g8 as a } bes b c es | c4 r r2 |
  r4 es8 c \tuplet 3/2 { es4 es f, } | b2 r |
  c,8 g' c, bes~ bes g' bes, as~ | as g' as, g~ g2 \key c \major
  R1 R1 r4 \tuplet 3/2 { g'8 gis a } g f c a | g f c'4 r8 d4 c8 | b4 r4 r2 | R1 |
  r4 e \tuplet 3/2 { d'8 c bes } \tuplet 3/2 { g e d } | c4. d8~ 4 e | f-. r r2
  R1*7 | \tuplet 3/2 { r8 c' d } \tuplet 3/2 { g d c } \tuplet 3/2 { bes c d } \tuplet 3/2 { g d c }  |
  \tuplet 3/2 { bes c d } \tuplet 3/2 { g d c } \tuplet 3/2 { bes c d } \tuplet 3/2 { g d c } |
  \tuplet 3/2 { bes c d } \tuplet 3/2 { gis d c } \tuplet 3/2 { bes c d } \tuplet 3/2 { gis d c } |
  bes2 r \key as \major
  r4 r8 c, as'8 4. | f4 r r2 | r4 r8 c8 as'8 4. | f4 r r2 | r4 r8 c8 as'8 4. | f4 r r2 | R1*4


}

Basse = \relative c' {
  \clef "bass" \key as \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold \box Intro
  c4 b bes a | as g fis e |
  f \tuplet 3/2 { g8 c f } \tuplet 3/2 { b, bes as  } f c | e8 f~ f2 r4 \bar "||" \break
  \repeat volta 2 {
  \mark #1 f2 e es d des c bes f c' bes as g f f4. as8 bes2 4. des8 \break
  es2 4. g,8 as2 4. c8 | des2 4. f8 g2 4. b8 |
  c2 bes as g \bar "||" \break \key c \major  }
  \alternative {
  {
    \mark #2 \overrideProperty Score.VoltaBracket.text \voltaAdLib
  e b \set Score.repeatCommands = #'((volta #f)) e b4 e | f2 c f c4 f | e2 b | e2 gis4 b, | c2 g' c, c \bar "||" \break
  f c | f c4 f | a2 e | a e4 fis | b2 ais | a gis4. fis8 | b2 ais | a gis |  \break
  g1 c, c c'4 bes as g  }
  { \key as \major \overrideProperty Score.VoltaBracket.text \voltaOnCue f2 c4. as'8 | }
  }
  c2 es,4. e8 |f 2 c4. as'8 | c2 es4. e8 | \break \bar "||"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \bold \box Outro
    f4 e es d | c bes as f8 as | b4 bes8 as \tuplet 3/2 { bes as f } es c | es e4 f8~ f2 \fermata
  \bar ".."
}


harmoniesB = \chordmode {
  \set chordChanges = ##f
r1*4 f2:m f:m7+/e f:m7/es f:m6/d des f:7/c bes:m s c:7 bes:m as:dim7 c:7/g
f1:m bes:m7 es:7 as:7+ des:7+ g:7
c2 c:7/bes c:5+/as c/g e1 e:7 f:6 f e e:7 c:9 s f s
a1 s2. fis4:7 b2 b:7+/ais b:7/a b:6/gis b2 b:7+/ais b:7/a b:6/gis
g1:m7 c:9 c:5+7 c:9+
f1:m c:9+ f:m c:9+ r
}


grille = \chordmode {
  \bar "[|:" \mark #1
  f2:m f:m/e f:m/es f:m/d des f:7/c bes1:m \break
  c2:7 bes:m as:dim7 c:7/g f1:m bes:m7 \break
  es:7 as:7+ des:7+ g:7 \break
  c2 c/bes c:5+/as c/g \bar "||" \stopStaff s1 \bar "" s \bar "" \break \startStaff
  \set Score.repeatCommands = #(list(list 'volta voltaAdLib)) \mark #2
  e \set Score.repeatCommands = #'((volta #f)) e:7 f:6 f \break
  e e:7 \repeat percent 2 c:9 \break
  \repeat percent 2 { f } a a2 a4 fis:7 \break
  b2 b:7+/ais b:7/a b:6/gis b2 b:7+/ais b:7/a b:6/gis \break
  g1:m7 c:9 c:5+7 c:9+ \break
  \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat)
  f:m \set Score.repeatCommands = #(list '(volta #f) ) c:9+ f:m c:9+


  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*15
  s1 ^\markup \bold \box \fontsize #5 B
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #3
    ragged-last-bottom = ##f
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \pad-around #2 \bold "  " }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes \\ { s1*18 \pageBreak s1*16 \pageBreak }
        >>
        \new Staff \voiceII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #3
    ragged-last-bottom = ##f
  }
  #(define output-suffix "BbTab")
  \header { meter = \markup \pad-around #2 \bold "  " }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes  \\ { s1*18 \pageBreak s1*16 \pageBreak }
        >>
        \new Staff \transpose c d \voiceII
      >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #3
    ragged-last-bottom = ##f
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \pad-around #2 "  " }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes  \\ { s1*18 \pageBreak s1*16 \pageBreak }
        >>
         \new Staff \transpose c a \voiceIII
     >> >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff
        \voiceII
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
        \new Staff \transpose c d \voiceII
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
        \new Staff \transpose c a \voiceIII
      >> >>
    } %\form
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
  }
  #(define output-suffix "BassTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesB }
        \new Staff \with { instrumentName = \CleFa } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \Basse
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmoniesB }
        \new Staff \with { instrumentName = \CleFa }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \Basse
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }
