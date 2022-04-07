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

title = #"Dum! Dum!"
composer = #"Eddy Louiss"
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
  asplayed = #"Stan Getz" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=2Tms3V-275A"
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
  \column { \line { \with-color #red \fontsize #2 "Solos on ABC" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  d2:m d:m/c d:m/b bes1*4:7 d:m d1:m
  \repeat unfold 6 { e:m5-7 a:7  }
  es1*2:7 d:7 b1*4:dim7 bes:dim7 d1*3:m d2:m/c d:m/b
  bes1*4:7 d:m b1*2:m5-7 b:dim7 bes:dim7 a1:m5-7 a:dim7 g:9- s g:m5-7 ges:7 f:7 s f8:7 r
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \set Staff.ottavationMarkups = #ottavation-ordinals
  \partial 2 d2 | f g \mark #1
  \repeat volta 2 {
    as1 R | r8 d,4 f8 bes as4 f8 | d c4 as8 d,4 f | \break
    bes a2.~ | 2. e'4 | bes a2.~
  }
  \alternative { { a2 r8 d f g } { r2 as,8 a a' as} } \break \mark #2 \bar "||"
  g1~ | 1 | r8 bes,,4 d8~ 8 e4 g8~ | 4 bes d bes |
  g'1~ | 1 | \break r8 bes,,4 d8~ 8 e4 g8~ | 8 bes4 d8~ 8 e4 g8~ |
  8 bes4 e,8~ 8 a4 g8~ | 1 | \ottava #1 r4 r8 e f g4 a8~ | a bes4 c8~ c d4 es!8~ | \break \mark #3
  1~ | 1 | r4 r8 d es d4 f8~ | f2 \tuplet 3/2 { r4 e es } |
  \tuplet 3/2 { es d2~ } 2~ | 1 | r4 r8 d~ d c4 b8~ | 8 as4 g8~ 8 f4 fes8~ | \break
  1~ | 1 | \ottava #0 R | r2 \startParenthesis \parenthesize e8 a~ \tuplet 3/2 { a e \endParenthesis \parenthesize a}
  e1~ | 1 | r2 d2 | f g \mark #4 \break
  as1 R | r8 d,4 f8 bes as4 f8 | d c4 as8 d,4 f |
  bes a2.~ | 2. e'4 | bes a2.| \ottava #1 r8 d r f r a r d~ | \break
  1~ | 1 | r2 \tuplet 3/2 { d4 e d } | f2 \tuplet 3/2 { r4 e d }
  \tuplet 3/2 { d4 des2~ } 2~ | 1 | r2 \tuplet 3/2 { c4 d! c } | es2 \tuplet 3/2 { r4 d c } | \break
  \tuplet 3/2 { c4 b2~ } 2~ | 1 | r2 \tuplet 3/2 { bes!4 c bes } | des2 \tuplet 3/2 { r4 c bes }  |
  \tuplet 3/2 { bes4 a2~ } 2~ | 1 \ottava #0
  \toCoda
  \improvisationOn a8-> \improvisationOff r8_\markup "Solo Break" r4 r2 R1
  \break \bar "||"
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \column { { \pad-around #1 " " } { "Solos on ABC" } }
  \markup { \with-color #red \musicglyph "scripts.varcoda" }
  r2 d, f g | as1 R | r8 d,4 f8 bes as4 f8 | d c4 as8 d,4 f |
  bes a2.~ | 2. e'4 | bes a2. \fermata |
  \bar ".." \pageBreak
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
  \stopStaff s1 \bar "" s \startStaff
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \Intro r2 d:m d:m/c d:m/a \break \mark #1
  \repeat volta 2 {
    \repeat percent 4 { bes1:7 } \break
    \repeat percent 4 { d:m } \break
  } \mark #2
  \repeat volta 2 { e:m5-7 a:7 e:m5-7 a:7 }
  \break \doubleMark
  \markup "3x"
  \markup \box C
  \repeat percent 2 { es:7 } \repeat percent 2 { d:7 } \break
  \repeat percent 4 { b:dim7 } \break
   \repeat percent 4 { bes:dim7 } \break
   \repeat percent 3 { d:m } d2:m/c d:m/b \break \bar "||" \mark #4
   \repeat percent 4 { bes1:7 } \break
    \repeat percent 4 { d:m } \break
  \repeat percent 2 { b:m5-7 } \repeat percent 2 { b:dim7 } \break
  \repeat percent 2 { bes:dim7 } a:m5-7 a:dim7 \break
  \repeat percent 2 { g:9- } g:m5-7 ges:7 \break
  \repeat percent 2 { f:7 } f4:7 r2. r1
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup "Solos on ABC"
  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
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
          \transpose c a, \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
    print-first-page-number = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
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
    print-first-page-number = ##t
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
    %}  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
    print-first-page-number = ##t
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
    %}  \bookpart {
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