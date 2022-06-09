\version "2.22.2"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
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

title = #"Nature's Beauty"
composer = #"Romero Lubambo"
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
  asplayed = #"Romero Lubambo" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=ZSZPQtOd1oU"
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
  \repeat unfold 2 { a1*2:m9 f:7+ }
  a:m f:7+ a:m bes/d a/cis d1:m7 g:9- c:5+7+ f:7+ e:7sus4 e:7
  a/cis s es:m5-7 as:9- des:7+ bes:m7 c:m5-7 f:9-
  bes/d s es:7+ s es:m5-7 es:m5-7/des b:m7 e:9-
  \repeat unfold 2 { a1*2:m f:7+ }
  a1:m9 s bes/d s b:m5-7 e:7 a:m9 s a:m9
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  \mark \markup \box Intro
  \comp #32 \break \bar "||-[|:"
  \repeat volta 2 {
    \mark #1
    \tuplet 3/2 { r4 a b } \tuplet 3/2 { c b a~ } | a2~ 8 e4 f8~ |
    f2~ 8 e'4 d8~ | 1 | \break
    r8 e, a b \tuplet 3/2 { c4 b a~ } | a2~ 8 g4 f8~ |
    f2~ 8 g'4 f8~ | 2 r8 g4 e8~ | \break
    e4. a,8 gis a4 e'8~ | 2 r8 cis4 d8 |
    e g r e~ e c4 d8~ | 2. r8 d8~ | \break
    d4. e8 \tuplet 3/2 { d4 b c~ } | 2 r8 b4 8~ | 1~ | 2 r
  } \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box B \raise #1 \with-color #red \bold \larger \musicglyph "scripts.varsegno" }
  e2.. gis8~ | 2.. 8~ | 4. a8 \tuplet 3/2 { gis4 g fis~ } | 2.. 8 | \break
  8 f4 gis f es8~ | 8 des4 c des f8| 4. ges8 \tuplet 3/2 { f4 e! es~ } | 1 \break
  f4. bes,8 a bes4 f'8~ | 1 | 4. bes,8 a bes4 f'8~ | 2.. 8~ | \break
  8 es4 ges f es8~ | 8 des4 c bes des8~ | 8 b4. \tuplet 3/2 { r4 d des } | c8 b4 gis f e8~ |
  \break \bar "||" \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \tweak self-alignment-X #RIGHT
  \mark \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  e1 \comp 28
  \break \bar "||" \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \tweak self-alignment-X #RIGHT
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "Solos on A the D.S. al Coda"
  \markup  \with-color #red \musicglyph "scripts.varcoda"
  \repeat volta 2 {
    e2.. \repeatTie e'8~ | 2.. f8~ | 2~ 8 g4 f8~ | 2.. 8~ \break
    2~ 8 es4 d8~ | 8 cis4 c gis b8~ | 1~ |  }
  \alternative { { 2. \tuplet 3/2 { g8 fis f } } { b1 \repeatTie } }
  \bar ".."
  \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:" \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Intro
  \repeat percent 2 { a1:m9 }\repeat percent 2 {  f:7+ } \bar ":|][|:" \break  \mark #1
  \repeat percent 2 { a:m } \repeat percent 2 { f:7+ }\break
  \repeat percent 2 { a:m } \repeat percent 2 { bes/d }\break
  \repeat percent 2 { a/cis } d:m7 g:9- \break
  c:5+7+ f:7+ e:7sus4 e:7 \bar ":|]"  \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box B \raise #1 \with-color #red \bold \larger \musicglyph "scripts.varsegno" }
  \repeat percent 2 { a/cis } es:m5-7 as:9-
  des:7+ bes:m7 c:m5-7 f:9- \break
  \repeat percent 2 { bes/d } \repeat percent 2 { es:7+ } \break
  es:m5-7 es:m5-7/des b:m7 e:9- \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \mark \markup   \with-color #red \musicglyph "scripts.varcoda"
  \repeat percent 2 { a1:m } \repeat percent 2 { f:7+ } \break \bar "||-[|:"
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "Solos on A the D.S. al Coda"
  \markup  \with-color #red \musicglyph "scripts.varcoda"
  \bar "[|:" \repeat percent 2 { a:m9 }\repeat percent 2 {  bes/d } b:m5-7 e:7 \repeat percent 2 { a:m9  } \bar ":|]"
}



\book {
  \paper {
    #(set-paper-size "a5landscape")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
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
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
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
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
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
          \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
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
          \transpose c d \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
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
          \transpose c a, \theNotes
        >>
      >>
    } %\form
  }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     %page-count = #1
%   }
%   #(define output-suffix "BassTab")
%   %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa } <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
% } }
%
% \book {
%   \paper {
%     #(set-paper-size "a4")
%     %page-count = #1
%   }
%   #(define output-suffix "Bassa4")
%   \bookpart {
%     \score {
%       <<
%         \new ChordNames { \harmonies }
%         \new Staff \with { instrumentName = \CleFa }
%         <<
%           %\new Voice \with { \consists "Pitch_squash_engraver" }
%           \Basse
%         >>
%       >>
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \\grille
% } } }

% \book {
%   %\paper { %page-count = #1
%	#(set-paper-size "a4")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSa4")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
%     } %\form
%     %}  \bookpart {
%     \score {
%       \layout {
%         indent = 0
%         \context {
%           \Score
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%         \context {
%           \ChordGrid
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Percent_repeat_engraver"
%         }
%       }
%       \new ChordGrid \transpose c a \grille
% } } }

% \book {
%   %\paper { %page-count = #2
%	#(set-paper-size "tablette")}
%   \header {meter = \markup \pad-around #1 \circle \bold \fontsize #-3 \concat {" " \musicglyph #"clefs.G" " "} }
%   \bookpart {
%     #(define output-suffix "RSTab")
%     \score {
%       <<
%         \new ChordNames {
%           \set chordChanges = ##f
%           \Accords
%         }
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Piano"
%           \new Voice = "Mel" { \chordsRhythm }
%         >>
%         \new Staff
%         <<
%           \set Staff.instrumentName = "Basse"
%           \new Voice = "Mel" { \clef "bass_8" \Basse }
%           \new Voice = "Ctrl" { \ossature }
%         >>
%       >>
%
% } } }