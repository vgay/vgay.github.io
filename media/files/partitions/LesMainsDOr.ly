\version "2.22.1"
#(set-global-staff-size 18)
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

title = #"Les mains d'or"
composer = #"Bernard Lavilliers"
meter = #"(Med. Salsa)"
kwtempo = #"Medium"
kwstyle = #"Salsa"
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
  arranger = "arr. Vincent Gay"
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

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
s1*6 b1:9- e:m6- b:9- e:m6-  b1:9- e:m6- b:9- e:m6- e:m6-
a:7 e:m b e:m e:m6-
  b:9- e:m6- b:9- e:m6- b:9- e:m6- b:9- e:m6-
}

harmoniesR = \chordmode {
  \set chordChanges = ##f
  s1 s b:9- e:m6- b:9- e:m6-
  b:9- e:m6- b:9- e:m6-
  a:7 e:m b e:m e:m6-
  b:9- e:m6- b:9- e:m6-
}


theNotes =  \relative c'' {
  \clef "treble" \key g \major \time 4/4
  \mark \markup \box \bold Intro
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 { R1 R1 }
  \repeat volta 2 {
    R1 R1 R1
    r4. b8 ^\markup "(2nd x)" e e e dis~ } \break \mark #1
  \repeat volta 2 {
    dis4 r8 b b c d! b~ | b4 r8 b8 e e e dis~ | dis4 r8 dis fis fis g e~ | 4 r8 g g g a g~ | \break
    4 r8 fis fis fis g e~ | 4 r8 b e e e dis~ | 4 r8 b b c d! b~
  }
  \alternative { { b4 r8 b e e e dis \laissezVibrer } { b4 \repeatTie r8 e8 \tuplet 3/2 { e4 fis g } } }
  \break \mark #2 \bar "||"
  \repeat volta 2 { \tuplet 3/2 { g fis c~ } c fis8 8 | \tuplet 3/2 { 4 e b~ } b r8 b | fis' dis b fis'~ fis4 8 g }
  \alternative { { fis8 e4 8~ 4 g8 g } { e4 r8 b' b c b b~ } }
  \break \mark #1 \bar "||"
  b8 fis r b b c b b~ | b g r b b c b b~ | b8 fis r b b c b b~ | 4 r8 b b c b b~ | \break
  b8 fis r b b c b b~ | b g r b b c b b~ | b8 fis r fis a g fis e~ | 4 r4 r2
  \bar ".."
}

chordsRhythm = \relative c' {
  \clef "treble_8" \key g \major \time 4/4
  \showStartRepeatBar \bar "[|:" \mark \markup \bold \box Intro
  \repeat volta 2 {
    b8 fis'16 b,~ b c8 a16~ a fis8 a16~ a ais8 b16 | b8 fis'16 b,~ b c8 a16~ a fis8 a16~ a ais8 b16
  } \break
  \repeat volta 2 {
    b8 fis'16 b,~ b c8 a16~ a fis8 a16~ a ais8 b16 | b8 fis'16 b,~ b c8 a16~ a e8 g16~ g a8 b16 |
    b8 fis'16 b,~ b c8 a16~ a fis8 a16~ a ais8 b16 | b8 fis'16 b,~ b c8 a16~ a e8 g16~ g a8 b16 |
  } \break
  \repeat volta 2 {
    \mark #1
    \repeat unfold 2 { b8 fis'16 b,~ b a8 fis16~ 2 | b8 fis'16 b,~ b g8 e16~ 2  }
  }
  \break \doubleMark
  \markup 4x
  \markup \bold \box B
  \repeat volta 2 {
    \improvisationOn \repeat unfold 3 { b'4 8 8~ 8 8 4-. }
  }
  \alternative {
    { b4 8 8~ 8 8 4-. } { b4 8 8~ 4 \improvisationOff g16 a8 b16 }
  } \bar "||-[|:"
  \repeat volta 2 {
    \break \mark #1
    \repeat unfold 2 { b8 fis'16 b,~ b a8 fis16~ 2 | b8 fis'16 b,~ b g8 e16~ 2  }
  }
}

Basse = \relative c {
  \clef "bass" \key g \major \time 4/4
  R1 R1
  b4. fis'4. e4~ | e4. c'4. b4 | b,4. fis'4. e4~ | e4. c'4. b4 |
  b,4. fis'4. e4~ | e4. c'4. b4 | b,4. fis'4. e4~ | e4. c'4. b4 |
  a,1 e' b | e4 fis g b | e,1
  b4. fis'4. e4~ | e4. c'4. b4 | b,4. fis'4. e4~ | e4. c'4. b4 |
  \bar ".."
}

grille = \chordmode {
  \bar "[|:"

  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*3
  s1 ^\markup \bold \box \fontsize #5 B s1*3
  s1 ^\markup \bold \box \fontsize #5 A
}


\book {
  \paper {
    #(set-paper-size "tablette")
    %page-count = #1
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
    %page-count = #1
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
    %page-count = #1
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
    %page-count = #1
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
          \transpose c a, \theNotes
        >>
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

\book {
  \paper { %page-count = #1
    #(set-paper-size "a4")}
  \bookpart {
    #(define output-suffix "RSa4")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmoniesR
        }
        \new Staff
        <<
          \set Staff.instrumentName = "Guitar"
          \new Voice = "Mel" { \chordsRhythm }
        >>
        \new Staff
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass_8" \Basse }
          %\new Voice = "Ctrl" { \ossature }
        >>
      >>
} } }

\book {
  \paper { %page-count = #2
    #(set-paper-size "tablette")}
  \bookpart {
    #(define output-suffix "RSTab")
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmoniesR
        }
        \new Staff
        <<
          \set Staff.instrumentName = "Guitar"
          \new Voice = "Mel" { \chordsRhythm }
        >>
        \new Staff
        <<
          \set Staff.instrumentName = "Basse"
          \new Voice = "Mel" { \clef "bass_8" \Basse }
        >>
      >>

} } }