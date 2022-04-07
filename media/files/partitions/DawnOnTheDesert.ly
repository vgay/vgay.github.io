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
  markup-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 2))
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

title = #"Dawn On The Desert"
composer = #"Charlie Shavers"
meter = #"(Latin Swing)"
kwtempo = #"Medium"
kwstyle = #"Latin / Swing"

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
  asplayed = #"John Kirby" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=CReFuz9qp3g"
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
  r1*13
  bes1*4:m7 es1*2:m7 f:7
   bes1*4:m7 f1*2:m7 bes:7
}


theNotes =  \relative c'' {
  \clef "treble" \key des \major \time 4/4 \Intro
  % \partial 8
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { R1*4 } \break \noPageBreak
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \pad-around #1 \concat { "Bass continues till " \box B }
  \markup \box A
  \repeat volta 2 {
    f1~ | 4 b,8 es a, b g a | \tuplet 3/2 { ges!4 f8~ } 2.~ | 4 r f8 ces' ges' ces \break \noPageBreak
    \tuplet 3/2 { e,4 f8~ } 2.~ | 4 es!8 as des, c ces f | \tuplet 3/2 { a,!4 bes8~ } 2.~
  }
  \alternative { { 4 r ces'8 ges des es } { bes4 \repeatTie r4 r2 } } \break \noPageBreak \mark #2
  << { \voiceOne
       f'1~ | 4 b,8 es a, b g a | \tuplet 3/2 { ges!4 f8~ } 2.~ | 4 r r f' \break
       \tuplet 3/2 { f es8~ } 2.~ | 1 | \tuplet 3/2 { e4 f8~ } 2.~ | 2  r4 f |\break
       f1~ | 4 b,8 es a, b g a | \tuplet 3/2 { ges!4 f8~ } 2.~ | 4 r r bes |\break
       b8 c~ 2.~ | 4 es8 a, b g a ges~ | ges f~  2.~ | 4 } \\
     { \voiceTwo
       bes1~ | 4 f8 as d, e c d | \tuplet 3/2 { c4 bes8~ } 2.~ | 4 r r bes'
       ges1~ | 1 | as8 a~ 2.~ | 2 r4 bes
       bes1~ | 4 f8 as d, e c d | c bes~ 2.~ | 4 r r es
       e8 f~ 2.~ | 4 as8  d, e c d c~ | c bes~ 2.~ | 4  }
  >>

  r2.
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c {
  \clef "bass" \key des \major \time 4/4
  \repeat unfold 2 { bes4 r8 f' ces4 r8 f | bes,4 r8 f' ces f ces f  }
  s1*9
  \repeat unfold 2 { bes,4 r8 f' ces4 r8 f | bes,4 r8 f' ces f ces f  }
  es,4 r8 bes' e,4 r8 bes' | es,4 r8 bes'e,8 bes' e, bes' |
  f4 r8 c' ges4 r8 c | f,4 r8 c' ges8 c ges c |
  \repeat unfold 2 {  bes4 r8 f' ces4 r8 f | bes,4 r8 f' ces f ces f  }|
  f,4 r8 c' ges4 r8 c | f,4 r8 c' ges8 c ges c |
  bes4 r8 f' ces4 r8 f | bes,4 r8 f' ces f ces f
  \bar ".."
}

grille = \chordmode {
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box Solos \small " (walking bass)" }
  \repeat percent 4 { bes1:m7 } \break
  \repeat percent 2 { es:m7 } \repeat percent 2 { bes:m7 } \break
  \repeat percent 2 { f:7 } \repeat percent 2 { bes:m7 }
    \label #'theLastPage

  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
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
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c a, \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }


\book {
  \paper {
    #(set-paper-size "a4")
    %page-count = #1
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
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
    } %\form
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
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c a, \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves } \Basse
      >> >>
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