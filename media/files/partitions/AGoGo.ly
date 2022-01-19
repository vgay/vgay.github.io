\version "2.22.1"
#(set-global-staff-size 18)
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

title = #"A Go Go"
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
  url = #"https://www.youtube.com/watch?v=-PXOr681_VU"
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
  r1*2 b1.:m7 e2:7
  b1.:m7 e2:7 b1.:m7 e2:7 b1*2:m7 b1.:m7 e2:7
  r1*4 b1.:m7 e2:7 b1.:m7 e2:7 b1*2:m7 b1.:m7 e2:7
  a8:7 gis:7 a:7 gis:7 a:7 gis:7 a16:7 bes8.:7
  b1.:m7 e2:7
}


theNotes =  \relative c' {
  \key d \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \mark \markup \box Intro
  \repeat volta 2 {
    R1
    \once \override Score.RehearsalMark.extra-offset = #'(-15 . -9)
    \mark \markup \fontsize #-1 "Bass fills over drums"
    R1 }
  \repeat volta 2 { <d fis>1~ | q2 r8 <e gis>4.  }
  \doubleMark
  \markup 4X
  \markup { \box \raise #-1 A \with-color #red \musicglyph "scripts.varsegno" }
  \repeat volta 2 {
    r4 fis'16 e d r e16 d8 fis16-. r8 d16 b-. | r16 b-. r8 r4 r2 |
    r4 fis'16 e d r e d8 fis16-. e d r b-. | r16 b-. r8 r4 r2 | \break
    r4
    << {
      fis'16  e d r e d8 fis16 r8 fis16 e | d r e[ d8 fis16] } \\
       { a,16 gis fis
         r gis fis8 a16 r8 a16 gis | fis r gis[ f8 a16] } >>
    r8 r2 |
    r4 fis'16 e d r e d8 fis16-. e d r b-. | r16 b-. r8 r4 r2 | \break }
  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "To Coda"
  \markup \box B
  \repeat volta 2 { g4-. fis16 g r bes~ bes4 r8 g8 | r16 g r8 r g r16 g r8 r4 }
  \mark \markup 3X g4-. fis16 g r bes~ bes4 r8 g8 |
  \once \override Score.RehearsalMark.extra-offset = #'(1 . -8.5)
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup "Drums Fills"
  R1
  \mark #1
  r4 fis'16 e d r e16 d8 fis16-. r8 d16 b-. | r16 b-. r8 r4 r2 |
  r4 fis'16 e d r e d8 fis16-. e d r b-. | r16 b-. r8 r4 r2 | \break
  r4
  << {
    fis'16  e d r e d8 fis16 r8 fis16 e | d r e[ d8 fis16] } \\
     { a,16 gis fis r gis fis8 a16 r8 a16 gis | fis r gis[ f8 a16] } >>
  r8 r2 |
  r4 fis'16 e d r e d8 fis16-. e d r b-. | r16 b-. r8 r4 r2 | \break
  \break \mark #3 \improvisationOn b8 b b b b b b16 b8. \improvisationOff
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \box Solos
  \repeat volta 2 { \comp #8 } \break

  \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
  \doubleMark
  \markup \with-color #red "D.S. al Coda (with repeat)"
  \markup \with-color #red \musicglyph "scripts.varcoda"
  \repeat volta 2 {
    r4
    <<
      {
        fis'16  e d b e d8 fis16 r8 fis16 e | d[ b e d8 fis16] r8 r2
        r4 fis16  e d b e d8 fis16 \tuplet 3/2 { r8 fis e } |
        \tuplet 3/2 { d b e } \tuplet 3/2 { d fis r }
      } \\
      {
        a,16 gis fis e gis fis8 a16 r8 a16 gis | fis[ gis gis f8 a16] r8 r2
        r4 a16 gis fis e gis fis8 a16 \tuplet 3/2 { r8 a gis } |
        \tuplet 3/2 { fis e gis } \tuplet 3/2 { fis a r }
    } >>
    \once \override TextScript #'extra-offset = #'( 2 . 1.5 )
    r2 ^\markup \fontsize #2 "ad lib." }
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
  \mark \markup "Guit. and Organ only last X"


}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c {
  \clef "bass" \key d \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  \comp #8
  \once \override TextScript #'extra-offset = #'( 0 . 1 )
  b2 ^\markup "Organ Fills" f4 a | b2 r8 e4.
  b2 f4 a | b2 r8 e4. | b2 f4 a | b2 r8 e4.
  b2 f4 a | b2 a4 fis | b2 f4 a | b2 r8 e4.
  g,4-. fis16 g r bes~ bes4 r8 g8 | r16 g r8 r g r16 g r8 r4
  g4-. fis16 g r bes~ bes4 r8 g8 | R1
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
       \new Staff \Basse
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
       \new Staff \Basse
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
       \new Staff \Basse
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
        \new Staff \Basse
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
       \new Staff \Basse
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
          \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a, \theNotes
        >>
       \new Staff \Basse
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