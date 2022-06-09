\version "2.22.1"
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
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 25)
                             (minimum-distance . 12)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 10)
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

title = #"Brazilian Like"
composer = #"Michel Petrucciani"
meter = #"(Mod. Samba)"
kwtempo = #"Medium"
kwstyle = #"Samba"

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
  asplayed = #"Michel Petrucciani" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=t7ynJeyqq7A"
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
  bes1:7sus2 bes:5+7sus2 bes:6sus2 bes:5+7sus2 bes1:7sus2 bes:5+7sus2 bes:6sus2 f:9-
  bes:m7 des:7/as g:dim7 ges:dim7 bes:m7/f bes:m7 c:m5-7 f:7.9-
  bes:m7 g:7 \repeat percent 2 { c } c2:m7 c:9+ f1:7 ges:7+ des/f
  es:m7 des:7+ c:9- f:9- bes:m7 bes:9- es:m7 as2:7 d:7
  des:7+ g:7.11+ ges1:7 c:9+ f:9- bes2..:m7 c8:7/bes s1 bes2..:m7 c8:7/bes
}


horns=  \relative c'' {

  R1*18
  r2.. g8^\markup horns  | a g a  g r e c
  << { g'8~ | \break g2~ 8 a bes a~ | a2 r8 bes c bes~^\markup piano | \bar "||" \mark #2 | 1 }
          \\ { d,8~ | d4. es8~ es4. f8~ | f4. g8~ g4.f8~ | 1 } >>
}

theNotes =  \relative c'' {
  \clef "treble" \key des \major \time 4/4
  \mark \markup \box Intro
  bes2.._\markup piano 8~ | 2.~ \tuplet 3/2 { 8 des c } | bes2~ 8 4. | r2 f'4 es8 des \break
  bes2.. 8~ | 2.~ \tuplet 3/2 { 8 des c } | bes1 | r8 ges4 a8~ 8 c4 f8~ \bar "||-[|:" \break
  \mark #1
  f4. bes,8~ 4. c8 | des4 c8 des~ des f4 e8~ | 2 r8 c4 es8~ | 2 r8 des4 bes8~ |  \break
  1~ 1 | r2 r8 des c bes | a4 bes8 c~ c es4 des8~ \break
  des es4 f8~ f f,4 b8~ | b c4 d8~ d g,4 es'8 |
e8 f4 g8~ g c,4.~ | 1 |\break R |  r2..  bes8~ | \bar "||" \mark #2 1 |

  r8 des' c bes \tuplet 3/2 { c4 as f~  }| \break
  1 | r8 bes as ges \tuplet 3/2 { as4 des, es~ } | 1 | r2 r8 es4 des8~ |  \break
  des es4 f8~ f2 | r8 bes, ^\markup horns ces des es fes ges as | bes1 | r8 des c bes c4 as8 f~ | \break
  1 | r8 bes as ges as4 des,8 es~ | 2. r8 c~ | 2 des | \break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \column { \pad-around #1 " " \box Interlude }
  \repeat volta 2 {
    << { f4.^\markup "piano sample" f8~ 8 bes4 c8~ | 8 c4 bes8 c4 bes | f4. f8~ 8 bes4 c8~ | 8 c4 bes8 c4 bes }
       \\ { bes,1~_\markup "horns 1st X" | 1~ | 1~  | 1 } >> }
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
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Intro
  bes1:9sus4 bes:5+9sus4 bes:6.9sus4 bes:5+9sus4 \break
  bes1:9sus4 bes:5+9sus4 bes:6.9sus4 ges:dim7/bes \break \bar "||"
  \mark #1
  bes:m7 des:7/as g:dim7 ges:dim7 \break
   bes:m7/f bes:m7 c:m5-7 f:9- \break
  bes:m7 g:7 \repeat percent 2 { c } \break
  c2:m7 c:9+ f1:7\bar "||" \mark #2  ges:7+ des/f \break
  es:m7 des:7+ c:9- f:9-  \break
  bes:m7 bes:9- es:m7 as2:7 d:7 \break
  des:7+ g:7.11+ ges1:7 c:9+ f:9-  \break
   \mark \markup \column { \pad-around #1 " " \box Interlude }
   \bar "[|:" bes:m7 c:7/bes bes:m7 c:7/bes \bar ":|]"
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
    %print-first-page-number = ##t
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
    %print-first-page-number = ##t
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
    page-count = #1
    print-page-number = ##f
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
    page-count = #1
    print-page-number = ##f
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
    print-page-number = ##f
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