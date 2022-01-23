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

title = #"Spain"
composer = #"Chick Corea"
meter = #"(Samba)"
kwtempo = #"Fast"
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
  asplayed = #"Chick Corea" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=nWgiNhTjIhU"
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
    \override TimeSignature #'break-visibility = #'#(#f #f #t)
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
  b2.:m a4 b1:m e2.:m g4 fis1:7 b:m g fis:m e2:m a:7sus4 d:m5-7 d:7+13 g:7 fis:7 b1:m
  r1*2 e1.:m11 fis:sus4 s1 g1*2:7+ fis:7
  e1:m7 a:9- d:7+ g:7+ cis:8 fis:7 b4.:sus4 b b4:1.3.5.9 s1
  r1*14
  g1*4:7+ fis:7 e1*2:m7 a:7 d:7+ g:7+ des:9+ ges:7 b:m b:7
}


theNotes =  \relative c' {
  \clef "treble" \key d \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.extra-offset = #'(0 . 2 )
  \mark \markup { \box \center-column { Intro Aranjuez } \small { \tiny \note {4} #1 \raise #-0.4 "= 64" } }
  \oneVoice
  fis32 e fis8.~ fis4~ fis8 fis16 g a8 \acciaccatura b8 a16 g |
  fis32 e fis8.~ fis4~ fis16 fis g a b8 cis | \break
  a16 g g fis \tuplet 3/2 { fis e d } e8~ e16 fis d cis d e cis b |
  cis2~ cis8 cis16 d e8 d16 cis | cis4 b2. \bar "||" \break
  b'32 a b8.~ b4~ b8 b16 cis d8 \acciaccatura e8 d16 cis |
  a32 g a8.~ a4~ a8 cis b16 a g a |
  g a g a b4 fis8 g16 fis g fis e d | \break
  cis8. d32 e fis2~ fis8 e16 d | cis d cis d e2~ e8 d16 cis | cis4 b2.\break
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.extra-offset = #'(0 . 1)
  \mark \markup { \box \bold "A" \small { \tiny \raise #0.4 \note {2} #1 "= 136"} }
  \once \override Staff.Clef #'break-visibility = #'#(#f #f #t)
  \time 2/2
  \repeat volta 2 {
    d'4-. fis8 d e d b d | r cis a cis r b g4-. |
    <e fis a>4. q8 r4 q4~ | q2 <b cis fis>4. q8 | \break
    r4 q2.~ | q2 r4 <bes fis'> |
    <b! g'>4. <cis a'>8~ q4 <d b'> |
    <e cis'>4. <fis d'>8~ q4 <g e'> | \break
    <fis d'>4. <e cis'>8 q2~ | q r4 <bes fis'> |
    \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \Segno
    <b g'>4. <cis a'>8~ q4 <d b'> |
    <g cis>4. <a d>8~ q4 <bes e> |  \break
    << { d4 e8 <cis fis>~ q2~ | q } \\ { a1~ | a2 } >> r8 e'4 d8 |
    \tuplet 3/2 { cis2 d e } | d cis |
    << { cis4. b8~ b2~ | b2. } \\
       { e,4. dis8~ dis4 <b cis fis>~ | q2. } >> r4
    \mark-y-dir #`( (,left . ,DOWN) (,right . ,UP) )
    \doubleMark
    \markup {\bold \with-color #(x11-color 'red) { "Last x : D.C." \box A "al Fine"} }
    \markup { { \box \fontsize #2 \bold B } "In unison" }
    \break
    b'8 r4 e8 r4. g8 | fis4 d8 b e4 r8 a,8 | r4. d8 cis4 r |
    a8 b4 g8~ g g d'4 | \break
    e4 r8 e g4 fis8 d | b4 d8 b e4 cis8 b |
    r8 fis e4 r8 fis4 b8 | cis4. \acciaccatura as8 bes8~ bes as! fis4  \break
    r8 cis fis cis gis' cis, bes' a~ | a fis4 fis'8 r4 <fis, b cis fis >4
  }
  \alternative {
    { <e gis b e>2 <d fis a d>4.
      << { b'8~ | b1~  b1
           \once \override Score.RehearsalMark #'outside-staff-priority = #49
           \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
           \once \override Score.RehearsalMark.extra-offset = #'(-2 . 0)
           \mark \markup { \italic \with-color #(x11-color 'red) "fine" }
         } \\
         { <e, fis>8~ | q2. <cis fis>4~  q1 } >>
    }
    { e'2 d4. b8~}
  }
  \bar "||" \C \break
  \override NoteColumn.ignore-collision = ##t

  << {
    \voiceTwo b1 _~
    \mergeDifferentlyHeadedOn b1~ } \new Voice { \voiceOne \startParenthesis \parenthesize e2 d4. \endParenthesis \parenthesize b8~ \hideNotes b1} >>



  b1 |
  \tuplet 3/2 { r4 b cis } \tuplet 3/2 { d e d } |  \break
  \acciaccatura cis8 d4. cis8~ cis4 ais~ | ais1~ | ais | r2 \acciaccatura e'8 fis2 |
  \break e4. d8~ d4 b~ | b1~ | b | \tuplet 3/2 { r4 a b } \tuplet 3/2 { cis d e } | \break
  d4. e8~ e4 fis~ | fis1~ | fis | \tuplet 3/2 { r2 \acciaccatura d8 e2 d } |  \break
  cis4. d8~ d4 e~ |
  << { \voiceOne e1~ | e | \tuplet 3/2 { r2 \acciaccatura c8 d2 c } } \new Voice
     { \voiceTwo r2 <g bes>2 | <fis a>4. <f as>8~ q4 <e g>4~ | q1 } >>  \break

  <e cis'>2.
  << { b'4~ | b1_~ } \\ { d,4~ | d1 } >>

  << {\voiceTwo b'1_~ | b2 } \\ { \voiceOne dis4 e8 fis fis2^~ | fis } >>


  r4 <bes,, fis'>
  \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark.extra-offset = #'(0 . -1)
  \mark \markup \with-color #(x11-color 'red) \right-column {
    "D.S. to 2nd ending, Repeat C to solos"
    "To end each solo play melody at C (use notes in parentheses)"
    "then D.S. to 2nd ending " }
  \bar ".."
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c {
  \clef "bass" \key f \major \time 4/4
  s1*11 \once \override Staff.Clef #'break-visibility = #'#(#f #f #t)
  \time 2/2
  d4-. fis8 d e d b d | r cis a cis r4 r8 b |
  e,4 b'8 g'~ g b, e,4~ | 2 fis4 cis'8 ais'~ |
  ais cis, fis,2.~ | 2 r2 | g2. d'4 | b'2 d,4 r | fis,2. cis'4 | ais'2 cis,4 r |
  e,2. b'4 | a'2 a, | d2. 4 | g,2. d'4 | c g2. | fis a4 | 4. b8~ 2 | 2. r4 \pageBreak

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
    page-count = #4
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
            \theNotes \\ { s1 \autoBreaksOff s1* 10 \pageBreak  s1*18 \pageBreak s1*22 \pageBreak }
          >>
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          \Basse
      >> >>
} } }

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
    page-count = #3
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
          \new Staff \with { \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t }
          \Basse
      >> >>
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
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
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
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes
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