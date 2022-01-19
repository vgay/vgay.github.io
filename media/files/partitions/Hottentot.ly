\version "2.22.1"
#(set-global-staff-size 17)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"Hottentot"
composer = #"John Scofield"
meter = #"(Med. Funk)"
kwtempo = #"Medium"
kwstyle = #"Funk"

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
  asplayed = #"John Scofield" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=anEvN78c0oQ"
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
    \override MultiMeasureRest #'expand-limit = #3
    %     \override NonMusicalPaperColumn #'line-break-permission = ##f
    %     \override NonMusicalPaperColumn #'page-break-permission = ##f
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

harmonies = \chordmode {
  \set chordChanges = ##f
  bes1*2:9+ s1 bes:9+ bes1*2:9+ b:9+ s1 bes:9+ bes1*2:9+
  bes2:9+ g:7.13/bes ges:m7.13/bes ges/as
  s1 bes:9+ bes1*2:9+
  bes1*2:9+ bes2:9+ g:7.13/bes ges:m7.13/bes ges/as
  bes1*2:9+ s1 bes:9+ bes1*2:9+
  bes2:9+ g:7.13/bes ges:m7.13/bes ges/as
}


theNotes =  \relative c'' {
  \clef "treble_8" \key f \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:" \mark \markup \box Intro
  \override TextSpanner.bound-details.left.text = \markup \fontsize #2 "Break"
  \improvisationOn
  \repeat volta 2 { b16 b r8 r16 16 16 r r2 | b16 b r8 r16 16 16 r r2  } \improvisationOff
  \break \mark #1
  \repeat volta 2 { f16 \startTextSpan f r bes~ bes8 as16 f  es f as f~ f4 \stopTextSpan |
                    b16 b r8 r8 16 16  r4 r8 r16 es,
                    r es r f es des bes as des8 bes16 f as as bes8
                    \improvisationOn b16 b r8 r16 16 16 r  \improvisationOff r2 }
  \break \mark #2 \improvisationOn
  \repeat volta 2 { b16 b r8 r16 16 16 r r2 | b16 b r8 r16 16 16 r r2 }
  \improvisationOff \break \mark #1
  f'16 \startTextSpan f r bes~ bes8 as16 f  es f as f~ f4 \stopTextSpan |
  \improvisationOn b16 b r8 r8 16 16  \improvisationOff r4 r8 r16 es,
  r es r f es des bes as  des8 bes16 f as as bes8 |
  \improvisationOn b16 b r8 r16 16 16 r \improvisationOff r4 bes8 bes  \bar "||-[|:"
  \break \mark #3
  \repeat volta 2 {
    f8. _\markup "play 1 octave upper 3rd and 4th X"
    bes16 r bes r e r4 bes8 des | es des16 es r des bes bes r4 bes8 bes }
  \break
  \doubleMark
  \markup 4x
  \markup \box A
  f'16 \startTextSpan f r bes~ bes8 as16 f  es f as f~ f4 \stopTextSpan |
  \improvisationOn b16 b r8 r8 16 16  \improvisationOff r4 r8 r16 es,
  r es r f es des bes as  des8 bes16 f as as bes8 |
  \improvisationOn b16 b r8 r16 16 16 r \improvisationOff r2 \bar "||-[|:"
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Solos \break
  \improvisationOn
  \repeat volta 2 { b16 b r8 r16 16 16 r r2 | b16 b r8 r16 16 16 r r2  } \improvisationOff
  \repeat volta 2 { \comp #8 } \break \mark \markup \box Intro
  \repeat volta 2 { b16 b r8 r16 16 16 r r2 | b16 b r8 r16 16 16 r r2  } \improvisationOff
  \break
  f'16 \startTextSpan f r bes~ bes8 as16 f  es f as f~ f4 \stopTextSpan |
  \improvisationOn b16 b r8 r8 16 16  \improvisationOff r2
  \mark \markup \box "Drums Solo" \improvisationOn
  \repeat volta 2 { b16 b r8 r16 16 16 r r2 | b16 b r8 r16 16 16 r r2  } \improvisationOff
  \once \override Score.RehearsalMark #'self-alignment-X = #CENTER
  \break \mark #3
  \repeat volta 2 {
    f,8. _\markup "play 1 octave upper 3rd and 4th X then Solo ad lib."
    bes16 r bes r e r4 bes8 des | es des16 es r des bes bes r4 bes8 bes }
  \break \doubleMark
  \markup 4X
  \markup \box Outro
  f16 \startTextSpan f r bes~ bes8 as16 f  es f as f~ f4 \stopTextSpan
  \mark \markup "Drums only"
  \improvisationOn b16 b r8 r4 r2 \bar ".."
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


\book {
  \paper {
    #(set-paper-size "tablette")
   }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
   }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
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
          \new Voice\with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
      >>
} } }

% \book {
%   \paper {
%     #(set-paper-size "tablette")
%     page-count = #1
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
%     page-count = #1
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
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )
%           \override ParenthesesItem.extra-offset = #'(10 . -1 )
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \grille
%       >>
% } } }

% \book {
%   %\paper { page-count = #1 #(set-paper-size "a4")}
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
%         ragged-right = ##f
%         ragged-last = ##f
%         \context {
%           \Score
%           \remove "Volta_engraver"
%           \omit Clef % Cacher la clef
%           \omit TimeSignature % cacher la métrique
%           \omit BarNumber
%           \override SpacingSpanner.strict-note-spacing = ##t
%           proportionalNotationDuration = #(ly:make-moment 1/16)
%         }
%       }
%       <<
%         \new Staff \with {
%           \remove "Staff_symbol_engraver"
%         }
%         \marques
%         \new ChordNames \with {
%           \override ChordName.extra-offset = #'(10 . -1 )
%           \override ParenthesesItem.extra-offset = #'(10 . -1 )
%           \override BarLine.bar-extent = #'(-5 . 5)
%           \consists "Bar_engraver"
%           \override StaffSymbol.line-positions = #'( -10 10 )
%           \consists "Staff_symbol_engraver"
%           \consists "Percent_repeat_engraver"
%           \consists "Volta_engraver"
%         }
%         \transpose c a \grille
%       >>
% } } }

% \book {
%   %\paper { page-count = #2 #(set-paper-size "tablette")}
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