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

title = #"Since You Asked"
composer = #"John Scofield"
meter = #"(Med. Swing Ballad)"
kwtempo = #"Medium"
kwstyle = #"Ballad"

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
  url = #"https://www.youtube.com/watch?v=frleuvis3a0"
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

form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
c2:m7 a:8 d:8 g:8 c:m7 es:m7 d2:m5-7 des:7+11+
c:m7 f:m7 bes:7 a:8 as:7+ d:7+ bes:7sus4 c:m7
f:8 e:7sus4 ces:7+ des:7 d:7+ e:7sus4 f:m7 bes4:7sus4 g:9-/b
c2:m7 a:8 d:8 g:8 c:m7 es:m7 d2:m5-7 des:7+11+
c:m7 f:m7 bes:7 a:8 as:7+ d:7+ bes:7sus4 c:m7
r1
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  % \partial 8
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup { \box "A " " (Bass in 2 fell for head, walks for solos)" }
  \repeat volta 2 {
    r4 \tuplet 3/2 { g8 f es } \tuplet 3/2 { c g r } es'4 |
    r4 << { \tuplet 3/2 { es8 f as~ } \tuplet 3/2 { as bes4 } \tuplet 3/2 { bes8 as4 } } \\
          { \tuplet 3/2 { s8 s des,~ } \tuplet 3/2 { des es4 } \tuplet 3/2 { es8 f4 } } >> |
    r4 \tuplet 3/2 { g8 f es } \tuplet 3/2 { bes' c r } as4~ |
    as as \tuplet 3/2 { g8 f es } c4 \break
    r4 \tuplet 3/2 { es8 d c } bes'2 |  r4 d \tuplet 3/2 { c8 bes g } \tuplet 3/2 { f es4 } |
    r4 g8 es \acciaccatura ges8 f16 es c8 4 | r2 \acciaccatura ges'8 f16 es c8 4 } \break \mark #2
  r4 des' \tuplet 3/2 { ces8 as ges } as4 |
  r \tuplet 3/2 { ges8 as ces~ } \tuplet 3/2 { ces des4 } \tuplet 3/2 { des8 ces des~ } |
  des4 des \tuplet 3/2 { ces8 as ges } as4~ |
  as \tuplet 3/2 { as8 g! f } <c! es>4 <b f'> \bar "||" \break \mark #1
  r4 \tuplet 3/2 { g'8 f es } \tuplet 3/2 { c g r } es'4 |
  r4 << { \tuplet 3/2 { es8 f as~ } \tuplet 3/2 { as bes4 } \tuplet 3/2 { bes8 as4 } } \\
        { \tuplet 3/2 { s8 s des,~ } \tuplet 3/2 { des es4 } \tuplet 3/2 { es8 f4 } } >> |
  r4 \tuplet 3/2 { g8 f es } \tuplet 3/2 { bes' c r } as4~ |
  as as \tuplet 3/2 { g8 f es } c4 \break
  r4 \tuplet 3/2 { es8 d c } bes'2 |  r4 d \tuplet 3/2 { c8 bes g } \tuplet 3/2 { f es4 } |
  r4 g8 es \acciaccatura ges8 f16 es c8 4 | r2 \acciaccatura ges'8 f16 es c8 4
  \bar "|." \break
  \doubleMark
  \markup { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
   \markup { \with-color #red { \musicglyph "scripts.varcoda" } }
   \override Staff.Clef #'break-visibility = #'#(#f #f #t)
   c4 r r \tuplet 3/2 { bes8 c es } | g4 as  << { \tuplet 3/2 { ges8 f4~ } f } \\ { s4 \tuplet 3/2 { bes,8 a4 } } >>
   \tuplet 3/2 { ges'8 f4 } \tuplet 3/2 { es8 c es~ } es es4 c8~ | 1 \fermata
   \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
   \mark \markup { \right-column { "Solos on form AABA" "After solos D.C. al Coda" \pad-around #3 " " } }
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c {
  \clef "bass" \key es \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  s1*20 \override Staff.Clef #'break-visibility = #'#(#f #f #t)
\repeat unfold 8 { c4 } | \tuplet 3/2 { bes8 c4 } \tuplet 3/2 { cis8 d es~ } es as,4 c8~ | 1 \fermata
  \bar ".."
}

grille = \chordmode {
  \bar "[|:" \/c2:m7 a:8 \/d:8 g:8 \/c:m7 es:m7 \/d:m5-7 des:7+11+ \break
\/c:m7 f:m7 \/bes:7 a:8 \/as:7+ d:7+ \/bes:7sus4 c:m7 \break \bar ":|]"
\/f:8 e:7sus4 \/ces:7+ des:7 \/d:7+ e:7sus4 \w f:m7 bes4:7sus4 g:9-/b \break
\/c2:m7 a:8 \/d:8 g:8 \/c:m7 es:m7 \/d:m5-7 des:7+11+ \break
\/c:m7 f:m7 \/bes:7 a:8 \/as:7+ d:7+ \/bes:7sus4 c:m7
  \bar ".." }

marques = \relative c' {
  s1 ^\markup \bold \box \fontsize #5 A s1*7
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
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
        \Basse
      >> >>
    }  %\form
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
          \transpose c a \theNotes
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
        \new StaffGroup <<
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
        \Basse
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
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
        >>
      >>
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
%         \grille
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