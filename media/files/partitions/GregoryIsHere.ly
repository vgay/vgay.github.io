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
    \override MultiMeasureRest #'expand-limit = #3
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

voltaOne = \markup { 1. \text { & } 3.}

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s4 b1*2:11+ c:m7 b:11+ c:m7 a1:m5-7 d:9- g:m7 c:7 c:m7
  b:9+ bes:7+ s bes:7+
  es:m7 as:7 des:7+ bes:m7 es:m7 as:7 c:m7 f:11+
  b1*2:11+ c:m7 b:11+ c:m7 a1:m5-7 d:9- g:m7 c:7 c:m7
  b:9+ bes:7+
}


theNotes =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4 f8 as~ \mark #1
  \repeat volta 2 {
    as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 f8 as~ | \break
    as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 d8 f~ | \break
    f d~ d2. | r4 d8 f~ f d4 d8~ |
    d1~ | d2 r4 d8 f~ | \break
    f d~ d2. r4 a8 c~ c a4 a8~ |
    a1~
  }
  \alternative {
    { a2 r4  f'8  as \laissezVibrer }
    { a,2 \repeatTie r4 bes8 bes'~ \bar "||" }
  }

  \bar "||" \break \mark #2
  bes1~ | bes4 as8 ges f es f g |
  as1~ | as4 ges8 f es des es f | \break
  ges1~ | \tuplet 3/2 { ges4 ges ges } \tuplet 3/2 { ges as ges } |
  f1~ | f4. r8 r4 f8 as~ \break \mark #1
  as f~ f2. | r4 f8 as~ as f4 f8~ |
  f1~ | f2 r4 f8 as~ | \break
  as f~ f2. | r4 f8 as~ as f4 f8~ |
  f1~ | f2 r4 d8 f~ | \break
  f d~ d2. | r4 d8 f~ f d4 d8~ |
  d1~ | d2 r4 d8 f~ | \break
  f d~ d2. r4 a8 c~ c a4 a8~ |
  a1~ | a2 r \bar ".."
}

VoiceTwo = \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  s4 s1*8 | r2 a8 as g ges~ | ges2. r4 |
  r4. f8~ f bes4 f8 | e f4 fis8~ fis4 g8 d'~ |
  d bes~ bes4 bes8 g bes a~ | a4 fis8 a~ a fis4 f8~ |
  f1~ | f2 r | f2 \repeatTie r s1*16
  r2 a8 as g ges~ | ges2. r4 |
  r4. f8~ f bes4 f8 | e f4 fis8~ fis4 g8 d'~ |
  d bes~ bes4 bes8 g bes a~ | a4 fis8 a~ a fis4 f8~ |
  f1~ | f2 r
}

harmoniesTab = \chordmode {
  \set chordChanges = ##f
  s4 b1*2:11+ c:m7 b:11+ c:m7 a1:m5-7 d:9- g:m7 c:7 c:m7
  b:9+ bes:7+ s bes:7+
  es:m7 as:7 des:7+ bes:m7 es:m7 as:7 c:m7 f:11+
}

theNotesTab =  \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  \partial 4 f8 as~ \mark #1
  \oneVoice
  \repeat volta 3 {
    as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 f8 as~ |
    as f~ f2. | r4 f8 as~ as f4 f8~ |
    f1~ | f2 r4 d8 f~ | \break
    f d~ d2. | r4 d8 f~ f d4 d8~ |
    d1~ | d2 r4 d8 f~ | \break
    f d~ d2. r4 a8 c~ c a4 a8~ |
    a1~
  }
  \set Score.repeatCommands = #(list(list 'volta voltaOne))
  { a2 r4 \startParenthesis \parenthesize f'8 \endParenthesis \parenthesize as \laissezVibrer
    \once \override  Score.RehearsalMark #'self-alignment-X = #3
    \once \override Score.RehearsalMark #'outside-staff-priority = #599
    \mark \markup \with-color #red \italic "Fine  "
  }
  \set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)

  { a,2 \repeatTie r4 bes8 bes' \bar "||" }
  \set Score.repeatCommands = #'((volta #f))

  \bar "||" \break \mark #2
  bes1~ | bes4 as8 ges f es f g |
  as1~ | as4 ges8 f es des es f | \break
  ges1~ | \tuplet 3/2 { ges4 ges ges } \tuplet 3/2 { ges as ges } |
  f1~ | f4. r8 r4 f8 as \laissezVibrer
  \set Score.repeatCommands = #'(end-repeat)
}

VoiceTwoTab = \relative c'' {
  \clef "treble" \key bes \major \time 4/4
  s4 s1*8 | r2 a8 as g ges~ | ges2. r4 |
  r4. f8~ f bes4 f8 | e f4 fis8~ fis4 g8 d'~ |
  d bes~ bes4 bes8 g bes a~ | a4 fis8 a~ a fis4 f8~ |
  f1~ | f2 r | f2 \repeatTie r
}



grille = \chordmode {
  \bar "[|:"
  \repeat percent 2 b1:9.11+ \repeat percent 2 c:m7 \break
  \repeat percent 2 b1:9.11+ \repeat percent 2 c:m7 \break
  a:m5-7 d:9- g:m7 c:7 \break
  \repeat percent 2 b1:9.11+ \repeat percent 2 c:m \break \bar ":|]"
  es:m as:7 des:7+ bes:m7 \break
  es:m7 as:7 c:m7 f:9.11+
  \repeat percent 2 b1:9.11+ \repeat percent 2 c:m7 \break
  \repeat percent 2 b1:9.11+ \repeat percent 2 c:m7 \break
  a:m5-7 d:9- g:m7 c:7 \break
  \repeat percent 2 b1:9.11+ \repeat percent 2 c:m
  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*15
  s1 ^\markup \bold \box \fontsize #5 B s1*7
  s1 ^\markup \bold \box \fontsize #5 A
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
        \new ChordNames { \harmoniesTab }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \theNotesTab
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } \VoiceTwoTab
      >> >>
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
        \new ChordNames { \transpose c d \harmoniesTab }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotesTab
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          \transpose c d \VoiceTwoTab
      >> >>
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
        \new ChordNames { \transpose c a \harmoniesTab }
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c a, \theNotesTab
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          \transpose c a, \VoiceTwoTab
      >> >>
    } %\form
} }

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
            \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t } \VoiceTwo
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c d \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          \transpose c d \VoiceTwo
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
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
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb }
          <<
            %\new Voice \with { \consists "Pitch_squash_engraver" }
            \transpose c a, \theNotes
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          \transpose c a, \VoiceTwo
      >> >>
    } %\form
  }  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )
          \override ParenthesesItem.extra-offset = #'(10 . -1 )
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 )
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
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